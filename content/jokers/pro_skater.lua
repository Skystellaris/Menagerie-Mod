SMODS.Joker {
    key = 'pro_skater',
    atlas = 'pro_skater',
    display_size = { w = 73, h = 73 },
    pixel_size = { w = 73, h = 73 },
    rarity = 3,
    config = {
        extra = {
            xmult = 1,
            gain = 1,
            hands = {},
            current = 1,
            stop = false
        }
    },

    loc_vars = function(self, info_queue, card)
        local nodes = {}

        local built_string = localize('k_mngy_hand_order')
        if #card.ability.extra.hands > 0 then

            for i, v in ipairs(card.ability.extra.hands) do
                built_string = built_string .. localize(v, 'poker_hands')
                if i < #card.ability.extra.hands then
                    built_string = built_string .. ', '
                    if string.len(built_string) > 30 then
                        table.insert(nodes, {
                            n = G.UIT.R,
                            config = { align = 'cm', padding = 0.06 },
                            nodes = {
                                {n = G.UIT.T, config = { colour = G.C.TEXT_INACTIVE, scale = 0.26, text = built_string }}
                            }
                        })
                        built_string = ''
                    end
                end
            end
        else
            built_string = built_string .. localize('k_none')
        end

        table.insert(nodes, {
            n = G.UIT.R,
            config = { align = 'cm', padding = 0.06 },
            nodes = {
                {n = G.UIT.T, config = { colour = G.C.TEXT_INACTIVE, scale = 0.26, text = built_string }}
            }
        })
                            

        local main_end = {{
            n = G.UIT.C,
            config = { align = 'cm'},
            nodes = nodes
        }}

        local next_hand_text = localize('k_none')
        if not card.ability.extra.stop and next(card.ability.extra.hands) then
            next_hand_text = localize(card.ability.extra.hands[card.ability.extra.current], 'poker_hands')
        end

        return { vars = { card.ability.extra.xmult, card.ability.extra.gain, next_hand_text }, main_end = main_end }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            card.ability.extra.hands = {}
            card.ability.extra.current = 1
            card.ability.extra.stop = false
            for i = 1, 3 do
                local valid_hands = {}
                for _, v in pairs(SMODS.PokerHands) do
                    if SMODS.is_poker_hand_visible(v.key) then
                        valid_hands[#valid_hands+1] = v.key
                    end
                end
                card.ability.extra.hands[#card.ability.extra.hands+1] = pseudorandom_element(valid_hands, 'mngy_pro_skater'..i)
            end
            return {
                message = localize('k_reset')
            }
        end

        if context.before and not context.blueprint and not card.ability.extra.stop then
            if card.ability.extra.hands[card.ability.extra.current] == context.scoring_name then
                SMODS.calculate_effect({ message = localize('k_mngy_combo') .. ' ' .. card.ability.extra.current, colour = G.C.ATTENTION, sound = 'mngy_combo'..card.ability.extra.current, pitch = 1 },card)
                if card.ability.extra.current >= #card.ability.extra.hands then
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = 'xmult',
                        scalar_value = 'gain',
                        scaling_message = {
                            message = localize('k_upgrade_ex'),
                            colour = G.C.ATTENTION,
                            sound = 'mngy_combo_finish',
                            pitch = 1
                        }
                    })
                    card.ability.extra.stop = true
                else
                    card.ability.extra.current = card.ability.extra.current + 1
                end
            else
                card.ability.extra.stop = true
                return {
                    message = localize('k_nope_ex'),
                    colour = G.C.SECONDARY_SET.Tarot,
                    sound = 'mngy_combo_fail',
                    pitch = 1
                }
            end
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
}