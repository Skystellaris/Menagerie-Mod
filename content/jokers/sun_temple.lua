SMODS.Joker {
    key = 'sun_temple',
    atlas = 'placeholders',
    pos = { x = 1, y = 0},
    rarity = 2,
    cost = 8,
    blueprint_compat = false,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
    end,
}