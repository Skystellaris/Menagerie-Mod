SMODS.Enhancement {
    key = 'doodle',
    atlas = 'enhancements',
    pos = { x = 4, y = 0 },
    never_scores = true,
    config = {
        extra = {
            prob = 1,
            odds = 2,
            retriggers = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        local num, den = SMODS.get_probability_vars(card, card.ability.extra.prob, card.ability.extra.odds)
        return { vars = { num, den, card.ability.extra.retriggers } }
    end,
}