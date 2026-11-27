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

    calculate = function(self, back, context)
        if context.starting_shop then
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_booster_to_shop('p_buffoon_normal_'..pseudorandom('mngy_mechanical', 1, 2))
                    return true;
                end
            }))
        end
    end,
}