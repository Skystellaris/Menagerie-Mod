SMODS.Back {
    key = 'stranded',
    atlas = 'placeholders',
    pos = { x = 4, y = 2 },

    calculate = function(self, back, context)
        if context.joker_type_destroyed then
            G.GAME.banned_keys[context.card.config.center_key] = true
            return {
                message = localize('k_mngy_banished_ex')
            }
        end
    end,
}
