SMODS.Joker {
    key = 'emergency_evac',
    atlas = 'placeholders',
    pos = { x = 2, y = 0 },
    rarity = 3,

    calculate = function(self, card, context)
        if context.reroll_shop and #G.playing_cards > 0 then
            local valid_cards = {}
            for _, v in pairs(G.playing_cards) do
                if not SMODS.is_eternal(v) then table.insert(valid_cards, v) end
            end
            local card_to_destroy = pseudorandom_element(valid_cards, 'mngy_evac')
            G.E_MANAGER:add_event(Event({
                func = function()
                    draw_card(G.deck, G.play, nil, nil, nil, card_to_destroy)
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 1,
                        func = function()
                            card:juice_up(0.8, 0.8)
                            SMODS.destroy_cards(card_to_destroy, {immediate = true})
                            return true;
                        end
                    }))
                    return true;
                end
            }))
        end
    end,
}