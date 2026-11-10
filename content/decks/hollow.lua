SMODS.Back {
    key = 'hollow',
    atlas = 'placeholders',
    pos = { x = 4, y = 2 },
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
                G.GAME.mngy_hollow = self.config.extra.multiplier - 1
                return true;
            end
        }))
    end,
}