SMODS.Joker {
    key = 'collectable',
    atlas = 'placeholders',
    pos = { x = 3, y = 1},
    rarity = 2,
    config = {
        extra = {
            hand_mult = 2,
            perma_mult = 0,
            gain = 15,
            goal = 7,
            hands = {}
        }
    },

    loc_vars = function(self, info_queue, card)
        local mult = (SMODS.table_size(card.ability.extra.hands) * card.ability.extra.hand_mult) + card.ability.extra.perma_mult
        return { vars = { card.ability.extra.hand_mult, card.ability.extra.goal, card.ability.extra.gain, mult } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            card.ability.extra.hands[context.scoring_name] = context.scoring_name
            if SMODS.table_size(card.ability.extra.hands) >= card.ability.extra.goal and not card.ability.extra.upgraded_this_ante then
                card.ability.extra.upgraded_this_ante = true
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "perma_mult",
                    scalar_value = "gain"
                })

                local valid_jokers = {}
                for _, v in pairs(G.jokers.cards) do
                    if not v.edition and v ~= card then
                        table.insert(valid_jokers, v)
                    end
                end
                if next(valid_jokers) then
                    local new_edition = SMODS.poll_edition({ key = 'mngy_collectable_edi', guaranteed = true })
                    pseudorandom_element(valid_jokers):set_edition(new_edition)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card:juice_up()
                            return true;
                        end
                    }))
                end
            end
        end

        if context.joker_main then
            return {
                mult = (SMODS.table_size(card.ability.extra.hands) * card.ability.extra.hand_mult) + card.ability.extra.perma_mult
            }
        end

        if context.ante_change and context.ante_end then
            card.ability.extra.upgraded_this_ante = nil
            card.ability.extra.hands = {}
            return {
                message = localize('k_reset')
            }
        end
    end,
}