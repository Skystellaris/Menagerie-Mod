SMODS.Joker {
    key = "desire_path",
    atlas = 'jokers_uncommon',
    pos = { x = 7, y = 1 },
    rarity = 2,
    blueprint_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = { localize('Straight', 'poker_hands'), localize('Flush', 'poker_hands'), localize('Straight Flush', 'poker_hands') } }
    end,

    calculate = function(self, card, context)
        if context.evaluate_poker_hand and G.GAME.current_round.hands_left == 0 then
            local poker_hands = context.poker_hands
            if next(context.poker_hands['Flush']) then
                poker_hands['Straight'] = {{ context.scoring_hand }}
                poker_hands['Straight Flush'] = {{ context.scoring_hand }}
                return {
                    replace_scoring_name = 'Straight Flush',
                    replace_poker_hands = poker_hands
                }
            else
                poker_hands['Straight'] = {{ context.scoring_hand }}
                return {
                    replace_scoring_name = 'Straight',
                    replace_poker_hands = poker_hands
                }
            end
        end
    end
}
