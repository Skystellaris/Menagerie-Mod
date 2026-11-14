local function menagerie_get_unique_rarities(card)
    if G.jokers then
        local rarities = {}
        for _, v in pairs(G.jokers.cards) do
            if v ~= card then
                rarities[v.config.center.rarity] = true
            end
        end
        return SMODS.table_size(rarities)
    end
    return 0
end

SMODS.Joker {
    key = 'ringleader',
    atlas = 'placeholders',
    pos = { x = 2, y = 0 },
    rarity = 3,
    config = {
        extra = {
            xmult = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        local xmult = 1 + menagerie_get_unique_rarities(card) * card.ability.extra.xmult
        return { vars = { card.ability.extra.xmult, xmult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = 1 + menagerie_get_unique_rarities(card) * card.ability.extra.xmult
            }
        end
    end,
}