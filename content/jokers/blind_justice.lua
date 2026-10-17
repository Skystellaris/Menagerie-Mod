SMODS.Joker {
    key = 'blind_justice',
    atlas = 'jokers_rare',
    pos = { x = 0, y = 0 },
    rarity = 3,
    config = {
        extra = {
            xmult = 2
        }
    },
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == 'unscored' and context.other_card:is_face() then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
}