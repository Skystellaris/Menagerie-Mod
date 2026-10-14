SMODS.Joker {
    key = 'rorschach',
    atlas = 'jokers',
    pos = { x = 2, y = 0},
    rarity = 1,
    blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_wild
    end,
}