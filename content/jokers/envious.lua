SMODS.Joker {
    key = 'envious',
    effect = 'Suit Mult',
    atlas = 'jokers_common',
    pos = { x = 3, y = 1 },
    rarity = 1,
    config = {
        extra = {
            s_mult = 5,
            suit = 'mngy_Shields'
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.s_mult, localize(card.ability.extra.suit, 'suits_singular') } }
    end,
}