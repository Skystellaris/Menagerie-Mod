SMODS.Joker {
    key = 'detective',
    atlas = 'placeholders',
    pos = { x = 1, y = 0},
    rarity = 2,
    cost = 8,
    config = {
        extra = {
            xmult = 0.75,
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,

    calculate = function(self, card, context)
        if context.pre_discard then
            card.ability.extra.primed = true
        end

        if context.drawing_cards and card.ability.extra.primed then
            card.ability.primed = nil
            local cards_to_draw = {}
            for i = #G.deck.cards, #G.deck.cards - context.amount, -1 do
                table.insert(cards_to_draw, G.deck.cards[i])
            end
            local card_to_flip = pseudorandom_element(cards_to_draw, 'mngy_detective')
            card_to_flip.mngy_detective_flip = true
        end

        if context.stay_flipped and context.from_area == G.deck and context.to == G.hand_area and context.other_card.mngy_detective_flip then
            context.other_card.mngy_detective_flip = nil
            return {
                stay_flipped = true
            }
        end

        if context.stay_flipped and context.from_area == G.hand and context.to_area == G.play and context.other_card.facing == 'back' then
            context.other_card.mngy_detective_score = true
        end

        if context.individual and context.cardarea == G.play and context.other_card.mngy_detective_score then
            context.other_card.mngy_detective_score = nil
            return {
                xmult = 1 + (card.ability.extra.xmult * #context.scoring_hand)
            }
        end

        if context.after then -- Reset fallback in case a a flipped card doesn't score
            for _, v in pairs(G.playing_cards) do
                if v.mngy_detective_score then
                    v.mngy_detective_score = nil
                end
            end
        end
    end,
}