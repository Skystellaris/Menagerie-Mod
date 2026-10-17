SMODS.Joker {
    key = 'moon_rabbit',
    atlas = 'jokers_rare',
    pos = { x = 4, y = 0 },
    rarity = 3,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_moon
        info_queue[#info_queue+1] = G.P_CENTERS.e_negative
    end,
    
    calculate = function(self, card, context)
        local stg = card.ability.extra
    
        if context.end_of_round and context.main_eval then
            local flip = SMODS.pseudorandom_probability(card, 'mngy_moon_rabbit', 1, 2, nil, true)

            if flip then
                SMODS.add_card({set = 'Joker', attributes = {'food'}, edition = 'e_negative'})
            else
                SMODS.add_card({key = 'c_moon', edition = 'e_negative'})
            end

            G.E_MANAGER:add_event(Event({
                func = function()
                    card:juice_up()
                    return true;
                end
            }))

            return nil, true
        end
    end,
}