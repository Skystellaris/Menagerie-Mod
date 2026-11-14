SMODS.Joker {
    key = 'stargazing',
    atlas = 'placeholders',
    pos = { x = 3, y = 1},
    rarity = 2,
    blueprint_compat = false,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_mngy_aurora
    end,
}