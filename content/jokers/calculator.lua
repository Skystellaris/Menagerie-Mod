SMODS.Joker {
    key = 'calculator',
    atlas = 'placeholders',
    pos = { x = 2, y = 0},
    rarity = 3,
    cost = 8,
    config = {
        extra = {
            xmult = 1.75,
            prob = 1,
        }
    },

    loc_vars = function(self, info_queue, card)
        local num = SMODS.get_probability_vars(card, card.ability.extra.prob, 1)
        return { vars = { card.ability.extra.xmult, num } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and not SMODS.has_no_rank(context.other_card)
        and not context.other_card:is_face() and SMODS.pseudorandom_probability(card, 'mngy_geode', card.ability.extra.prob, context.other_card.base.nominal) then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
}