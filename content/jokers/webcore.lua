SMODS.Joker {
    key = 'webcore',
    atlas = 'placeholders',
    pos = { x = 2, y = 0},
    rarity = 3,
    config = {
        extra = {
            xmult = 0.3,
        }
    },

    loc_vars = function(self, info_queue, card)
        local xmult = G.GAME.mngy_hands_last_ante and  1 + (SMODS.table_size(G.GAME.mngy_hands_last_ante) * card.ability.extra.xmult) or 1
        return { vars = { card.ability.extra.xmult, xmult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and G.GAME.mngy_hands_last_ante then
            return {
                xmult = 1 + (SMODS.table_size(G.GAME.mngy_hands_last_ante) * card.ability.extra.xmult)
            }
        end

        if context.ante_change and context.ante_end then
            return {
                message = localize('k_mngy_nostalgic')
            }
        end
    end,
}