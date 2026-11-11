SMODS.Enhancement {
    key = 'confetti',
    atlas = 'placeholders',
    pos = { x = 3, y = 1 },
    config = {
        extra = {
            xmult = 0.2
        },
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if not SMODS.pseudorandom_probability(card, 'mngy_confetti', 1, #context.full_hand) then
                return {
                    xmult = 1 + (card.ability.extra.xmult * #G.hand.cards)
                }
            end
        end
    end,
}