local function reset_beat(card, fail)
    if fail then
        card.ability.extra.xmult = 1
        SMODS.calculate_effect({ message = localize('k_reset') }, card)
    else
        SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = "xmult",
            scalar_value = "gain"
        })
    end
    card.ability.extra.ranks = {
        Ace = false,
        ['2'] = false,
        ['3'] = false,
        ['4'] = false
    }
end

SMODS.Joker {
    key = 'keeping_beat',
    atlas = 'placeholders',
    pos = { x = 2, y = 0},
    rarity = 3,
    cost = 8,
    config = {
        extra = {
            xmult = 1,
            gain = 0.4,
            ranks = {
                Ace = false,
                ['2'] = false,
                ['3'] = false,
                ['4'] = false
            }
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.gain, card.ability.extra.xmult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local ranks_table = card.ability.extra.ranks
            if context.other_card:get_id() == 14 then
                if ranks_table['Ace'] then
                    reset_beat(card, true)
                else
                    ranks_table['Ace'] = true
                    SMODS.calculate_effect({ message = localize('k_mngy_one_ex') },card)
                end
            elseif context.other_card:get_id() == 2 then
                if not ranks_table['Ace'] then
                    reset_beat(card, true)
                else
                    ranks_table['2'] = true
                    SMODS.calculate_effect({ message = localize('k_mngy_two_ex') },card)
                end
            elseif context.other_card:get_id() == 3 then
                if not ranks_table['2'] then
                    reset_beat(card, true)
                else
                    ranks_table['3'] = true
                    SMODS.calculate_effect({ message = localize('k_mngy_three_ex') },card)
                end
            elseif context.other_card:get_id() == 4 then
                if not ranks_table['3'] then
                    reset_beat(card, true)
                else
                    ranks_table['4'] = true
                    SMODS.calculate_effect({ message = localize('k_mngy_four_ex') },card)
                    reset_beat(card)
                end
            end
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
}
