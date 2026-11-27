SMODS.Joker {
    key = 'collectable',
    atlas = 'placeholders',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 5,
    config = {
        extra = {
            hand_mult = 2,
            goal = 7,
            hands = {},
            perma_hands = {}
        }
    },

    loc_vars = function(self, info_queue, card)
        local mult = SMODS.table_size(card.ability.extra.hands) * card.ability.extra.hand_mult
        return { vars = { card.ability.extra.hand_mult, card.ability.extra.goal, mult } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            card.ability.extra.hands[context.scoring_name] = context.scoring_name
            card.ability.extra.perma_hands[context.scoring_name] = context.scoring_name
            if not card.edition and SMODS.table_size(card.ability.extra.perma_hands) >= card.ability.extra.goal then
                local new_edition = SMODS.poll_edition({ key = 'mngy_collectable_edi', guaranteed = true })
                card:set_edition(new_edition)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up()
                        return true;
                    end
                }))
            end
        end

        if context.joker_main then
            return {
                mult = SMODS.table_size(card.ability.extra.hands) * card.ability.extra.hand_mult
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
