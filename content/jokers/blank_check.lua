SMODS.Joker {
    key = 'blank_check',
    atlas = 'placeholders',
    pos = { x = 0, y = 0},
    rarity = 1,
    cost = 6,
    blueprint_compat = false,
    mngy_empty = true,
    config = {
        extra = {
            low = 0,
            high = 10
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.low, card.ability.extra.high, } }
    end,

    calc_dollar_bonus = function(self, card)
        return pseudorandom('mngy_blank_check'..G.GAME.round, card.ability.extra.low, card.ability.extra.high)
    end
}