SMODS.Joker {
    key = 'ancestral',
    atlas = 'placeholders',
    pos = { x = 3, y = 1},
    rarity = 2,
    blueprint_compat = false,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        return { vars = { G.P_CENTERS.m_stone.config.bonus } }
    end,
}