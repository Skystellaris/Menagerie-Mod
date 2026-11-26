SMODS.Joker {
    key = 'cardboard',
    atlas = 'placeholders',
    pos = { x = 0, y = 0},
    rarity = 1,
    cost = 5,
    config = {
        extra = {
            xmult = 3
        }
    },
    blueprint_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.xmult }
        }
    end,

    calculate = function(self, card, context)
        if context.final_scoring_step and G.GAME.current_round.hands_left == 0 and SMODS.calculate_round_score() + to_big(G.GAME.chips) < to_big(G.GAME.blind.chips) then
            SMODS.destroy_cards(card)
            return {
                xmult = card.ability.extra.xmult,
            }
        end
    end
}
