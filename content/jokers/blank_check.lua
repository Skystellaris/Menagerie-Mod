SMODS.Joker {
    key = 'blank_check',
    atlas = 'placeholders',
    pos = { x = 3, y = 1},
    rarity = 2,
    blueprint_compat = false,
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