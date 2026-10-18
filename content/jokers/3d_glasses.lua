SMODS.Joker {
    key = '3d_glasses',
    atlas = 'jokers_uncommon',
    pos = { x = 8, y = 1 },
    rarity = 2,
    config = {
        extra = {
            prob = 1,
            odds = 2,
            repetitions = 1,
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_holo
        info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
        local num, den = SMODS.get_probability_vars(card, card.ability.extra.prob, card.ability.extra.odds)
        return { vars = { num, den, card.ability.extra.repetitions, card.ability.extra.repetitions * 2 } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card.edition and context.other_card.edition.holo and SMODS.has_enhancement(context.other_card, 'm_bonus') then
                return {
                    repetitions = card.ability.extra.repetitions * 2
                }
            elseif (context.other_card.edition and context.other_card.edition.holo) or SMODS.has_enhancement(context.other_card, 'm_bonus') then
                if SMODS.pseudorandom_probability(card, 'mngy_3d', card.ability.extra.prob, card.ability.extra.odds) then
                    return {
                        repetitions = card.ability.extra.repetitions
                    }
                end
            end
        end
    end,
}