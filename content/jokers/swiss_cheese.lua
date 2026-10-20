SMODS.Joker {
    key = 'swiss_cheese',
    atlas = 'jokers_uncommon',
    pos = { x = 5, y = 0 },
    rarity = 2,
    blueprint_compat = false,
    mngy_empty = true,

    calculate = function(self, card, context)
        if context.drawing_cards then
            local last_held = {}
            local final_list = {}
            for i, v in ipairs(G.deck.cards) do
                if v.mngy_swiss_scored then
                    table.insert(last_held, G.deck.cards[i])
                else
                    table.insert(final_list, G.deck.cards[i])
                end
            end

            for i, v in ipairs(last_held) do
                v.mngy_swiss_scored = nil
                table.insert(final_list, #final_list + 1, v)
            end

            G.deck.cards = final_list
        end

        if context.individual and context.cardarea == G.play and (context.other_card:get_id() == 2 or context.other_card:get_id() == 3 or context.other_card:get_id() == 4) then
            context.other_card.mngy_swiss_scored = true
        end

        if context.stay_flipped and context.to_area == G.discard and context.from_area == G.play and context.other_card.mngy_swiss_scored then
            return {
                modify = {
                    to_area = G.deck
                }
            }
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        local stg = card.ability.extra
    
        if not next(SMODS.find_card('j_mngy_swiss_cheese')) then
            
            for i, v in ipairs(G.deck.cards) do
                if v.mngy_swiss_scored then
                    v.mngy_swiss_scored = nil
                end
            end
        end
    end,
}