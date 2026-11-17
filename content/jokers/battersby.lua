SMODS.Joker {
    key = 'battersby',
    atlas = 'placeholders',
    pos = { x = 3, y = 1},
    rarity = 2,
    config = {
        extra_slots_used = 1,
        extra = {
            xmult = 1,
        }
    },

    loc_vars = function(self, info_queue, card)
        local xmult = G.jokers and (#G.jokers.cards - 1) * card.ability.extra.xmult or 1
        return { vars = { card.ability.extra.xmult, xmult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = (#G.jokers.cards - 1) * card.ability.extra.xmult
            }
        end
    end,
}