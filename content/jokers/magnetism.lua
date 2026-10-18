SMODS.Joker {
    key = 'magnetism',
    atlas = 'jokers_uncommon',
    pos = { x = 1, y = 1 },
    rarity = 2,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_steel

        return { vars = { localize{ set = 'Enhanced', type = 'name_text', key = 'm_steel'} } }
    end,

    calculate = function(self, card, context)
        if context.hand_drawn then
            for _, v in pairs(context.hand_drawn) do
                if SMODS.has_enhancement(v, 'm_steel') then
                    local valid_steels = {}
                    for _, vv in pairs(G.deck.cards) do
                        if SMODS.has_enhancement(vv, 'm_steel') and not vv.mngy_magnetized then
                            valid_steels[#valid_steels+1] = vv
                        end
                    end

                    if next(valid_steels) then
                        local magnetized = pseudorandom_element(valid_steels, 'mngy_mangetism')
                        magnetized.mngy_magnetized = true
                        draw_card(G.deck, G.hand, 1,'up', true, magnetized)
                        return {
                            message = localize('k_mngy_magnetized_ex')
                        }
                    end
                    break
                end
            end
        end

        if context.other_drawn then
            for _, v in pairs(context.other_drawn) do
                if SMODS.has_enhancement(v, 'm_steel') then
                    local valid_steels = {}
                    for _, vv in pairs(G.deck.cards) do
                        if SMODS.has_enhancement(vv, 'm_steel') and not vv.mngy_magnetized then
                            valid_steels[#valid_steels+1] = vv
                        end
                    end

                    if next(valid_steels) then
                        local magnetized = pseudorandom_element(valid_steels, 'mngy_mangetism')
                        magnetized.mngy_magnetized = true
                        draw_card(G.deck, G.hand, 1,'up', true, magnetized)
                        return {
                            message = localize('k_mngy_magnetized_ex')
                        }
                    end
                    break
                end
            end
        end
    end,
}