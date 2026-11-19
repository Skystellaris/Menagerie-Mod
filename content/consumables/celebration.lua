SMODS.Consumable {
    key = 'celebration',
    set = 'Tarot',
    atlas = 'placeholders',
    pos = { x = 1, y = 2 },
    config = {
        max_highlighted = 2,
        mod_conv = 'm_mngy_confetti'
    },
    attributes = {
        'modify_card',
        'enhancements'
    },
    cost = 4,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}
