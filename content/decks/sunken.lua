SMODS.Back {
    key = 'sunken',
    atlas = 'placeholders',
    pos = { x = 4, y = 2 },

    calculate = function(self, back, context)
        if context.modify_scoring_hand then
            return {
                add_to_hand = true
            }
        end

        if context.stay_flipped and context.from_area == G.hand and context.to_area == G.discard then
            return {
                modify = {to_area = G.deck}
            }
        end
    end,
}
