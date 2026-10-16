SMODS.Back {
    key = 'echo',
    atlas = 'placeholders',
    pos = { x = 4, y = 2 },
    config = {
        joker_slot = -1,
        jokers = { 'j_invisible' }
    },

    loc_vars = function(self, info_queue, back)
        return {
            vars = {
                localize { type = 'name_text', key = self.config.jokers[1], set = 'Joker' },
                self.config.joker_slot
            }
        }
    end,
}