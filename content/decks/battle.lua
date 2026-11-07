SMODS.Back {
    key = 'battle',
    atlas = 'decks',
    pos = { x = 0, y = 1 },
    config = {
        discards = -3
    },
    initial_deck = {
        suits = {
            'Clubs',
            'mngy_Shields'
        },
    },
    include_shields = true,

    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.discards } }
    end,
}