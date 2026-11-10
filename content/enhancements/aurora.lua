SMODS.Enhancement {
    key = 'aurora',
    atlas = 'placeholders',
    pos = { x = 3, y = 1 },

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            G.GAME.mngy_aurora_scores = (G.GAME.mngy_aurora_scores or 0) + 1
            return {
                xmult = 1 + (G.GAME.mngy_aurora_scores * 0.1)
            }
        end

        if context.after then
            G.GAME.mngy_aurora_scores = 0
        end
    end,
}