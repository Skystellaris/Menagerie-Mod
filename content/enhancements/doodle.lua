SMODS.Enhancement {
    key = 'doodle',
    atlas = 'placeholders',
    pos = { x = 3, y = 1 },
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