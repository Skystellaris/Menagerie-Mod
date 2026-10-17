SMODS.Joker {
    key = 'tetrominoker',
    atlas = 'jokers_rare',
    pos = { x = 2, y = 0 },
    rarity = 3,
    config = {
        extra = {
            extra_cards = 4,
            hand = 'Straight Flush'
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.extra_cards, localize(card.ability.extra.hand, 'poker_hands') } }
    end,

    calculate = function(self, card, context)
        if context.drawing_cards and not G.GAME.current_round.any_hand_drawn and G.GAME.facing_blind then
            return {
                modify = context.amount + card.ability.extra.extra_cards
            }
        end

        if context.hand_drawn and context.first_hand_drawn then
            local poker_hands = evaluate_poker_hand(G.hand.cards)
            if next(poker_hands[card.ability.extra.hand]) then -- Check if hand initially contains a straight flush

                local sf_cards = {}
                -- Check for common cards in each straight and flush
                for _, straights in pairs(poker_hands['Straight']) do
                    for _, v in pairs(straights) do
                        for _, flushes in pairs(poker_hands['Flush']) do
                            for _, vv in pairs(flushes) do
                                if v == vv then
                                    table.insert(sf_cards, v)
                                    break
                                end
                            end
                            -- Check if common Straight and Flush part cards still make a Straight Flush
                            if next(evaluate_poker_hand(sf_cards)[card.ability.extra.hand]) then
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        SMODS.destroy_cards(sf_cards)
                                        card:juice_up(0.8, 0.8)
                                        return true;
                                    end
                                }))
                                return
                            else
                                sf_cards = {}
                            end
                        end
                    end
                end
            end
        end
    end,
}