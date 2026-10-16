SMODS.Back {
    key = 'null',
    atlas = 'placeholders',
    pos = { x = 4, y = 2 },

    calculate = function(self, back, context)
        if context.fix_probability then
            return {
                numerator = 0
            }
        end
    end,
}
