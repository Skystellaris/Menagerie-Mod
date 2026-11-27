SMODS.Joker {
    key = 'stardust',
    atlas = 'placeholders',
    pos = { x = 1, y = 0},
    rarity = 2,
    cost = 7,
    config = {
        extra = {
            percent = 10,
            chips = 100
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.percent, card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if hand_chips > mult then
                local difference = math.floor(hand_chips * (card.ability.extra.percent / 100))
                return {
                    chips = -difference,
                    mult = difference
                }
            else
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end,
}