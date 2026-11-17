SMODS.Back {
    key = 'sunken',
    atlas = 'placeholders',
    pos = { x = 4, y = 2 },

    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                local _c = SMODS.add_card({key = 'j_splash', edition = 'e_negative'})
                _c:start_materialize()
                return true;
            end
        }))
    end,

    calculate = function(self, back, context)
        if context.stay_flipped and context.from_area == G.hand and context.to_area == G.discard then
            return {
                modify = {to_area = G.deck}
            }
        end
    end,
}
