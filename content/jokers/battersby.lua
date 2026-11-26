SMODS.Joker {
    key = 'battersby',
    atlas = 'placeholders',
    pos = { x = 0, y = 0},
    rarity = 1,
    cost = 6,
    config = {
        extra_slots_used = 1,
        extra = {
            xmult = 1,
        }
    },

    loc_vars = function(self, info_queue, card)
        local xmult = G.jokers and math.max(#G.jokers.cards * card.ability.extra.xmult, 1) or 1
        return { vars = { card.ability.extra.xmult, xmult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = math.max(#G.jokers.cards * card.ability.extra.xmult, 1)
            }
        end
    end,
}