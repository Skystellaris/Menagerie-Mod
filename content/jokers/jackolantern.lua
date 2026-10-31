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
        if context.destroying_card and context.cardarea == G.play and context.destroying_card:get_id() == 11 and SMODS.pseudorandom_probability(card, 'jackolantern', card.ability.extra.prob, card.ability.extra.odds) then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = 'xmult',
                scalar_value = 'gain',
            })
            return {
                remove = true
            }
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
}