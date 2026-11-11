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
        local highlighted = G.hand and #G.hand.highlighted or 1
        local num, denom = SMODS.get_probability_vars(card, 1, highlighted)
        return { vars = { card.ability.extra.xmult, num, denom } }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if not SMODS.pseudorandom_probability(card, 'mngy_confetti', 1, #context.full_hand) then
                return {
                    xmult = 1 + (card.ability.extra.xmult * #G.hand.cards)
                }
            else
                return {
                    message = localize('k_nope_ex'),
                    colour = G.C.SECONDARY_SET.Tarot,
                    sound = 'tarot2',
                    pitch = 0.76,
                }
            end
        end
    end,
}
