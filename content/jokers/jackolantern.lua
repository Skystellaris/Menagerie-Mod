SMODS.Joker {
    key = 'jackolantern',
    atlas = 'jokers_rare',
    pos = { x = 0, y = 1 },
    rarity = 3,
    config = {
        extra = {
            xmult = 1,
            gain = 0.31,
            prob = 1,
            odds = 6
        }
    },
    
    loc_vars = function(self, info_queue, card)
        local num, den = SMODS.get_probability_vars(card, card.ability.extra.prob, card.ability.extra.odds)
        return { vars = { card.ability.extra.gain, card.ability.extra.xmult, num, den } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 11 then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = 'xmult',
                scalar_value = 'gain',
            })
            return nil, true
        end

        if context.after and SMODS.pseudorandom_probability(card, 'jackolantern', card.ability.extra.prob, card.ability.extra.odds) then
            local jacks_to_destroy = {}
            for _, v in pairs(context.scoring_hand) do
                if v:get_id() == 11 then
                    table.insert(jacks_to_destroy, v)
                end
            end
            SMODS.destroy_cards(jacks_to_destroy)
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:juice_up(0.8, 0.8)
                    return true;
                end
            }))
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
}