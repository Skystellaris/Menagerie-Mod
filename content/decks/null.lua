SMODS.Back {
    key = 'null',
    atlas = 'decks',
    pos = { x = 2, y = 1 },

    calculate = function(self, back, context)
        if context.fix_probability then
            return {
                numerator = 0
            }
        end
    end,
}
