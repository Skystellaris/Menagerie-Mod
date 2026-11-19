SMODS.Consumable {
    key = 'comet',
    set = 'Tarot',
    atlas = 'placeholders',
    pos = { x = 1, y = 2 },
    config = {
        max_highlighted = 3,
        suit_conv = 'mngy_Shields'
    },
    attributes = {
        'modify_card',
        'suit'
    },
    cost = 4,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end,
}
