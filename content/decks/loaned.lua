SMODS.Back {
    key = 'loaned',
    atlas = 'decks',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            debt = 15
        }
    },

    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.extra.debt } }
    end,

    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.bankrupt_at = G.GAME.bankrupt_at - self.config.extra.debt
                return true;
            end
        }))
    end,

    calculate = function(self, back, context)
        if context.setting_blind and G.GAME.blind.boss then
            ease_dollars(-G.GAME.dollars)
        end
    end,
}