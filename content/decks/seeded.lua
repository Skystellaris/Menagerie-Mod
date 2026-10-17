SMODS.Back {
    key = 'seeded',
    atlas = 'placeholders',
    pos = { x = 4, y = 2 },

    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.hand:change_size(G.jokers.config.card_limit)
                G.GAME.mngy_seeded = true
                return true;
            end
        }))
    end,
}