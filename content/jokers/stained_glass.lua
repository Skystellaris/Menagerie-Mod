SMODS.Joker {
    key = 'stained_glass',
    atlas = 'jokers_rare',
    pos = { x = 5, y = 0 },
    rarity = 3,
    blueprint_compat = false,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
        info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
    end,

    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            local glasses_shattered = 0
            for k, v in pairs(context.scoring_hand) do
                if v.glass_trigger then
                    glasses_shattered = glasses_shattered + 1
                end
            end

            if glasses_shattered > 0 then
                local wilds = {}
                for i = 1, glasses_shattered do
                    local valid_cards = {}

                    for _, v in pairs(G.hand.cards) do
                        if v.ability ~= 'Enhanced' and not v.mngy_will_wild then
                            valid_cards[#valid_cards + 1] = v
                        end
                    end

                    local card_to_wild = pseudorandom_element(valid_cards, 'mngy_stained_glass')
                    card_to_wild.mngy_will_wild = true
                    wilds[#wilds + 1] = card_to_wild
                end


                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('tarot1')
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))

                for i = 1, #wilds do
                    local percent = 1.15 - (i - 0.999) / (#wilds - 0.998) * 0.3
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            wilds[i]:flip(); play_sound('card1', percent)
                            wilds[i]:juice_up(0.3,0.3)
                            return true
                        end
                    }))
                end
                delay(0.2)

                for i = 1, #wilds do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.1,
                        func = function()
                            wilds[i]:set_ability(G.P_CENTERS['m_wild'])
                            wilds[i].mngy_will_wild = nil
                            return true
                        end
                    }))
                end

                for i = 1, #wilds do
                    local percent = 0.85 + (i - 0.999) / (#wilds - 0.998) * 0.3
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            wilds[i]:flip()
                            play_sound('tarot2', percent, 0.6)
                            wilds[i]:juice_up(0.3, 0.3)
                            return true
                        end
                    }))
                end
                delay(0.5)
            end
        end
    end,
}
