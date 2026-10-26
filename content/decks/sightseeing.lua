SMODS.Back {
    key = 'sightseeing',
    atlas = 'decks',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            multiplier = 3
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.multiplier } }
    end,

    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.mngy_sightseeing = self.config.extra.multiplier - 1
                return true;
            end
        }))
    end,
}