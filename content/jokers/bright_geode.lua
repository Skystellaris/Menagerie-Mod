SMODS.Joker {
    key = 'bright_geode',
    atlas = 'placeholders',
    pos = { x = 1, y = 0 },
    rarity = 2,
    config = {
        extra = {
            xchips = 1.33,
            prob = 1,
            odds = 2,
        }
    },

    loc_vars = function(self, info_queue, card)
        local num, den = SMODS.get_probability_vars(card, card.ability.extra.prob, card.ability.extra.odds)
        return { vars = { card.ability.extra.xchips, num, den } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:is_suit("mngy_Shields") then
            return {
                xchips = card.ability.extra.xchips
            }
        end
    end,
}