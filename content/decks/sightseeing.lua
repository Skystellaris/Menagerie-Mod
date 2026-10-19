SMODS.Back {
    key = 'sightseeing',
    atlas = 'decks',
    pos = { x = 0, y = 0 },

    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.mngy_sightseeing = true
                return true;
            end
        }))
    end,
}