SMODS.Back {
    key = 'splatterpaint',
    atlas = 'decks',
    pos = { x = 4, y = 1 },
    include_shields = true,

    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.mngy_spawn_shields = true
                return true;
            end
        }))
    end,

    calculate = function(self, back, context)
        if context.end_of_round and context.main_eval and context.beat_boss then
            local suits_in_deck = {}
            for _, v in pairs(G.playing_cards) do
                if v.base.suit then
                    suits_in_deck[v.base.suit] = v.base.suit
                end
            end

            local suit_to_change = pseudorandom_element(suits_in_deck)

            local valid_suits = {}
            for _, v in pairs(SMODS.Suits) do
                if SMODS.add_to_pool(v, {suit = v.key}) and v.key ~= suit_to_change then
                    table.insert(valid_suits, v.key)
                end
            end

            local chosen_suit = pseudorandom_element(valid_suits)

            for _, v in pairs(G.playing_cards) do
                if v.base.suit == suit_to_change then
                    assert(SMODS.change_base(v, chosen_suit))
                end
            end

            return {
                message = localize('k_mngy_splattered_ex')
            }
        end
    end,
}