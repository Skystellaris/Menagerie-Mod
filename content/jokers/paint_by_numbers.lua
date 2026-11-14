local function menagerie_get_unique_suits(scored_hand)
    local suits = {}
    for _, v in pairs(scored_hand) do
        suits[v.base.suit] = true
    end
    return SMODS.table_size(suits)
end

SMODS.Joker {
    key = 'paint_by_numbers',
    atlas = 'jokers_common',
    pos = { x = 5, y = 1 },
    rarity = 1,
    config = {
        extra = {
            chips = 5
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.other_card:is_face() then
            return {
                chips = menagerie_get_unique_suits(context.scoring_hand) * card.ability.extra.chips
            }
        end
    end,
}
