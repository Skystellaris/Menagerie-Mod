SMODS.Joker {
    key = 'acceleration',
    atlas = 'placeholders',
    pos = { x = 1, y = 0},
    rarity = 2,
    cost = 6,
    config = {
        extra = {
            repetitions = 1,
            prob = 1,
            odds = 9
        }
    },

    loc_vars = function(self, info_queue, card)
        local num, den = SMODS.get_probability_vars(card, card.ability.extra.prob, card.ability.extra.odds)
        return { vars = { num, den } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.other_card:get_id() == 14 then
            local rets = card.ability.extra.repetitions
            if SMODS.pseudorandom_probability(card, 'mngy_acceleration', card.ability.extra.prob, card.ability.extra.odds) then
                rets = rets + 1
            end
            card.ability.extra.prob = card.ability.extra.prob + rets
            return {
                repetitions = rets
            }
        end

        if context.after and not context.blueprint then
            card.ability.extra.prob = 1
        end
    end,
}