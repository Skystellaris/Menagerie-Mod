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
                -- Check hand for each suit
                for _, v in pairs(SMODS.Suits) do
                    local this_suit_cards = {}
                    for _, pcard in pairs(G.hand.cards) do
                        if pcard.base.suit == v.key then
                            table.insert(this_suit_cards, pcard)
                        end
                        -- If quantity of cards from this suit can make a straight or a flush, check further
                        if #this_suit_cards >= SMODS.four_fingers() then
                            local this_suit_hands = evaluate_poker_hand(this_suit_cards)
                            -- If card of only this suit creates a straight flush, then destroy
                            if next(this_suit_hands[card.ability.extra.hand]) then
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        SMODS.destroy_cards(this_suit_hands[card.ability.extra.hand][1], {immediate = true})
                                        card:juice_up(0.8, 0.8)
                                        G.GAME.mngy_tetrominoker_hits = (G.GAME.mngy_tetrominoker_hits or 0) + 1
                                        check_for_unlock({type = 'mngy_combo'})
                                        return true;
                                    end
                                }))
                                return
                            end
                        end
                    end
                end
            end
        end
    end,
}