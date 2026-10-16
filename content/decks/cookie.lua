SMODS.Back {
    key = 'cookie',
    atlas = 'placeholders',
    pos = { x = 4, y = 2 },
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

        if context.card_added then
            context.card.sell_cost = -1
        end
    end,
}
