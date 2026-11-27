SMODS.Joker {
    key = 'flashlight',
    atlas = 'placeholders',
    pos = { x = 1, y = 0 },
    rarity = 2,
    cost = 5,
    config = {
        extra = {
            chips = 30
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.stay_flipped and context.from_area == G.hand and context.to_area == G.play and context.other_card.facing == 'back' then
            context.other_card.mngy_flashlight_score = true
        end

        if context.individual and context.cardarea == G.play and context.other_card.mngy_flashlight_score then
            context.other_card.mngy_flashlight_score = nil
            return {
                chips = card.ability.extra.chips
            }
        end
    end,

    update = function(self, card, dt)
        if G.hand and next(G.hand.cards) then
            for _, v in pairs(G.hand.cards) do
                if v.facing == 'back' and Menagerie.are_cards_colliding(card.T, v.T) and not v.mngy_flashlight_looking then
                    v.mngy_flashlight_looking = true
                    v:flip()
                    play_sound('card1')
                elseif v.facing == 'front' and not Menagerie.are_cards_colliding(card.T, v.T) and v.mngy_flashlight_looking then
                    v.mngy_flashlight_looking = nil
                    v:flip()
                    play_sound('card1')
                end
            end
        end
    end
}