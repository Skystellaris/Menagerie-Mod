SMODS.Back {
    key = 'hopscotch',
    atlas = 'placeholders',
    pos = { x = 4, y = 2 },
    config = {
        extra = {
            tags = 2,
            shop_slots = -2
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.shop_slots, self.config.extra.tags } }
    end,

    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                change_shop_size(self.config.extra.shop_slots)
                return true;
            end
        }))
    end,

    calculate = function(self, back, context)
        if context.skip_blind then
            for i = 1, self.config.extra.tags do
                add_tag(context.skip_tag)
            end
        end
    end,
}