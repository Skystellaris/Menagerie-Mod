SMODS.Joker {
    key = 'silver_wind',
    atlas = 'placeholders',
    pos = { x = 3, y = 1},
    rarity = 2,
    config = {
        extra = {
            prob = 1,
            money_odds = 3,
            dollars = 7,
            card_odds = 7,
        }
    },

    loc_vars = function(self, info_queue, card)
        local money_num, money_den = SMODS.get_probability_vars(card, card.ability.extra.prob, card.ability.extra.money_odds)
        local card_num, card_den = SMODS.get_probability_vars(card, card.ability.extra.prob, card.ability.extra.card_odds)
        return { vars = { money_num, money_den, card.ability.extra.dollars, card_num, card_den } }
    end,
    
    calculate = function(self, card, context)
        if context.before and next(context.poker_hands['Flush']) then
            local all_clubs = true
            for _, v in pairs(context.scoring_hand) do
                if not v:is_suit('Clubs', nil, true) then
                    all_clubs = false
                    break
                end
            end
            if all_clubs then
                if SMODS.pseudorandom_probability(card, 'mngy_silver_wind_spec', card.ability.extra.prob, card.ability.extra.card_odds) and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card:juice_up()
                            SMODS.add_card({set = 'Spectral'})
                            G.GAME.consumeable_buffer = 0
                            return true;
                        end
                    }))
                end
                if SMODS.pseudorandom_probability(card, 'mngy_silver_wind_money', card.ability.extra.prob, card.ability.extra.money_odds) then
                    return {
                        dollars = card.ability.extra.dollars
                    }
                end
            end
        end
    end,
}