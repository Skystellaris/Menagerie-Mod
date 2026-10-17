SMODS.Back {
    key = 'sightseeing',
    atlas = 'placeholders',
    pos = { x = 4, y = 2 },

    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.mngy_sightseeing = true
                return true;
            end
        }))
    end,
}