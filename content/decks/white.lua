SMODS.Back {
    key = 'stacked',
    atlas = 'placeholders',
    pos = { x = 4, y = 2 },

    apply = function(self, back)
        --Change limits
        G.E_MANAGER:add_event(Event({
            func = function()
                SMODS.change_play_limit(1)
                SMODS.change_discard_limit(1)
                return true;
            end
        }))
    end
}