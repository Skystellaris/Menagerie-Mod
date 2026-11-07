SMODS.Back {
    key = 'perfection',
    atlas = 'decks',
    pos = { x = 6, y = 1 },
    config = {
        hands = -3,
        discards = -2
    },
    include_shields = true,

    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.hands, self.config.discards } }
    end,

    apply = function(self, back)
        local available_suits = {}
        for _, v in pairs(SMODS.Suits) do
            if SMODS.add_to_pool(v, {initial_deck = true, suit = v.key}) then
                table.insert(available_suits, v.key)
            end
        end

        local chosen_suit = pseudorandom_element(available_suits)

        if chosen_suit == 'mngy_Shields' then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.mngy_spawn_shields = true
                    return true;
                end
            }))
        end

        G.GAME.selected_back_key.initial_deck = {
            suits = { chosen_suit }
        }
    end
}