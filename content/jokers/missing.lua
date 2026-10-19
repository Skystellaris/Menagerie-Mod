SMODS.Joker {
    key = 'missing',
    atlas = 'jokers_uncommon',
    pos = { x = 6, y = 0 },
    rarity = 2,
    blueprint_compat = false,
    config = {
        card_limit = 1
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = { set = 'Other', key = 'mngy_empty' }
    end,
}