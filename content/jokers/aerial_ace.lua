SMODS.Joker {
    key = 'aerial_ace',
    atlas = 'placeholders',
    pos = { x = 2, y = 0 },
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
        if context.repetition and context.cardarea == G.play and G.GAME.current_round.hands_played == 0 then
            if context.other_card:get_id() == 14 then
                return {
                    repetitions = card.ability.extra.repetitions,
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end,
}