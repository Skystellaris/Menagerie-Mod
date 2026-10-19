SMODS.Back {
    key = 'cookie',
    atlas = 'decks',
    pos = { x = 3, y = 1 },
    config = {
        extra = {
            dollars = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.dollars } }
    end,

    calculate = function(self, back, context)
        if context.using_consumeable then
            return {
                dollars = self.config.extra.dollars
            }
        end
    end,
}
