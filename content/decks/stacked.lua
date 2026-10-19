SMODS.Back {
    key = 'stacked',
    atlas = 'decks',
    pos = { x = 1, y = 0 },

    calculate = function(self, back, context)
        if context.drawing_cards and not G.GAME.current_round.any_hand_drawn and G.GAME.facing_blind then
            local last_held = {}
            local final_list = {}
            for i, v in ipairs(G.deck.cards) do
                if v.mngy_last_held then
                    table.insert(last_held, G.deck.cards[i])
                else
                    table.insert(final_list, G.deck.cards[i])
                end
            end

            for i, v in ipairs(last_held) do
                v.mngy_last_held = nil
                table.insert(final_list, #final_list + 1, v)
            end

            G.deck.cards = final_list
        end

        if context.end_of_round and context.main_eval then
            for _, v in pairs(G.hand.cards) do
                v.mngy_last_held = true
            end
        end
    end,
}
