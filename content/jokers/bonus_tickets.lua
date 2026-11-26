SMODS.Joker {
    key = 'bonus_tickets',
    atlas = 'placeholders',
    pos = { x = 1, y = 0},
    rarity = 2,
    cost = 6,
    config = {
        extra = {
            prob = 1,
            ret_odds = 2,
            retriggers = 1,
            money_odds = 5,
            dollars = 5
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
        local ret_num, ret_den = SMODS.get_probability_vars(card, card.ability.extra.prob, card.ability.extra.ret_odds)
        local money_num, money_den = SMODS.get_probability_vars(card, card.ability.extra.prob, card.ability.extra.money_odds)
        return { vars = { ret_num, ret_den, card.ability.extra.retriggers, money_num, money_den, card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_bonus') and SMODS.pseudorandom_probability(card, 'mngy_bonus_tickets_money', card.ability.extra.prob, card.ability.extra.money_odds) then
            return {
                dollars = card.ability.extra.dollars
            }
        end

        if context.repetition and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_bonus') and SMODS.pseudorandom_probability(card, 'mngy_bonus_tickets_money', card.ability.extra.prob, card.ability.extra.ret_odds) then
            return {
                repetitions = card.ability.extra.retriggers
            }
        end
    end,
}