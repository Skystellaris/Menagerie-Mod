SMODS.Joker {
    key = 'left_mitten',
    atlas = 'placeholders',
    pos = { x = 3, y = 1 },
    rarity = 2,
    config = {
        extra = {
            gain = 1,
            mult = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.gain, card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.before then
            local lowest = true
            for _, v in pairs(context.scoring_hand) do
                if v ~= context.scoring_hand[1] and v:get_id() < context.scoring_hand[1]:get_id() and not SMODS.has_no_rank(v) then
                    lowest = false
                end
            end
            if lowest then
                context.scoring_hand[1].ability.perma_mult = context.scoring_hand[1].ability.perma_mult or 0
                context.scoring_hand[1].ability.perma_mult = context.scoring_hand[1].ability.perma_mult + card.ability.extra.gain
                if not context.blueprint then
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "mult",
                        scalar_value = "gain",
                    })
                end
                SMODS.calculate_effect({ message = localize('k_upgrade_ex') }, context.scoring_hand[1])
                return nil, true
            end
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
}
