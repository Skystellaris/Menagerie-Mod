SMODS.Joker {
    key = 'lucky_clover',
    atlas = 'jokers_uncommon',
    pos = { x = 0, y = 1 },
    rarity = 3,
    config = {
        extra = {
            xmult_prob = 1,
            xmult_odds = 4,
            xmult = 1.4,

            luck_prob = 1,
            luck_odds = 50,
            luck_gain = 1,
            luck_max = 4,
            luck = 0,
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_lucky
        local xmult_num, xmult_den = SMODS.get_probability_vars(card, card.ability.extra.xmult_prob, card.ability.extra.xmult_odds)
        local luck_num, luck_den = SMODS.get_probability_vars(card, card.ability.extra.luck_prob, card.ability.extra.luck_odds)
        return { vars = { xmult_num, xmult_den, card.ability.extra.xmult, luck_num, luck_den, card.ability.extra.luck_gain, card.ability.extra.luck_max, card.ability.extra.luck } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_lucky') then

            if SMODS.pseudorandom_probability(card, 'clover_luck', card.ability.extra.luck_prob, card.ability.extra.luck_odds) and card.ability.extra.luck < card.ability.extra.luck_max then
                local _c = context.other_card
                _c.lucky_trigger = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        _c:juice_up()
                        return true;
                    end
                }))
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'luck',
                    scalar_value = 'luck_gain',
                })
            end
        end

        if context.mod_probability then
            return {
                numerator = context.numerator + card.ability.extra.luck
            }
        end
    end,
}