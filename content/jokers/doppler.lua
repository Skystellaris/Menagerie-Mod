SMODS.Joker {
    key = 'doppler',
    atlas = 'jokers',
    pos = { x = 9, y = 0 },
    rarity = 1,
    config = {
        extra = {
            scoring_state = true,
            scoring_xmult = 2,
            dormant_xmult = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.scoring_state and card.ability.extra.scoring_xmult or card.ability.extra.dormant_xmult, card.ability.extra.scoring_state and card.ability.extra.dormant_xmult or card.ability.extra.scoring_xmult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.scoring_state and card.ability.extra.scoring_xmult or card.ability.extra.dormant_xmult
            }
        end

        if context.after and SMODS.last_hand_oneshot then
            card.ability.extra.scoring_state = not card.ability.extra.scoring_state
            return {
                message = localize('k_swapped_ex')
            }
        end
    end,
}