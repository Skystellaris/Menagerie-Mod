SMODS.Back {
    key = 'seeded',
    atlas = 'decks',
    pos = { x = 7, y = 1 },

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