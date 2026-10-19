SMODS.Joker {
    key = 'jollibee',
    atlas = 'jokers_common',
    pos = { x = 0, y = 0 },
    rarity = 1,
    config = {
        extra = {
            chips = 26
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
}