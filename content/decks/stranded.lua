SMODS.Back {
    key = 'stranded',
    atlas = 'decks',
    pos = { x = 1, y = 1 },

    calculate = function(self, back, context)
        if context.joker_type_destroyed then
            G.GAME.banned_keys[context.card.config.center_key] = true
            return {
                message = localize('k_mngy_banished_ex')
            }
        end
    end,
}
