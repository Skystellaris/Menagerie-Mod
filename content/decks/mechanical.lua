SMODS.Back {
    key = 'mechanical',
    atlas = 'placeholders',
    pos = { x = 4, y = 2 },
    config = {
        extra = {
            c_slots = 3
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.c_slots } }
    end,

    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.joker_rate = 0
                G.consumeables.config.card_limit = G.consumeables.config.card_limit + self.config.extra.c_slots
                return true;
            end
        }))
    end,
}