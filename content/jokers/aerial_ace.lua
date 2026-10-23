SMODS.Joker {
    key = 'aerial_ace',
    atlas = 'jokers_uncommon',
    pos = { x = 5, y = 1 },
    rarity = 2,
    config = {
        extra = {
            repetitions = 1,
            dollars = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        -- Aerial Ace: Aces are retriggered, and give $1 when scored on the first Hand of a round.
        if context.repetition and context.cardarea == G.play then
            if context.other_card:get_id() == 14 then
                if G.GAME.current_round.hands_played == 0 then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card:juice_up()
                            return true;
                        end
                    }))
                    SMODS.calculate_effect({ dollars = card.ability.extra.dollars }, context.other_card)
                end
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end
    end,
}