SMODS.Joker {
    key = 'chameleon',
    atlas = 'placeholders',
    pos = { x = 1, y = 0},
    rarity = 2,
    cost = 10,

    loc_vars = function(self, info_queue, card)
        if card.ability.mngy_fake_copy then
            local vars = {}
            if card.ability.mngy_fake_copy.config.center.loc_vars then
                vars = card.ability.mngy_fake_copy.config.center:loc_vars({}, card.ability.mngy_fake_copy).vars
            else
                vars = Card.generate_UIBox_ability_table({ability = card.ability.mngy_fake_copy.ability, config = card.ability.mngy_fake_copy.config, bypass_lock = true}, true)
            end
            info_queue[#info_queue+1] = { mngy_fake_copy = true, set = 'Joker', key = card.ability.mngy_fake_copy.key, vars = vars }
        end
        return { vars = { card.ability.mngy_fake_copy and localize({type = 'name_text', set = 'Joker', key = card.ability.mngy_fake_copy.key}) or localize('k_none') } }
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind then
            if card.ability.mngy_fake_copy then
                Card.remove_from_deck(card.ability.mngy_fake_copy)
            end

            local new_key

            if SMODS.pseudorandom_probability(card, 'mngy_cham_owned_jkrs', 1, 2, nil, true) then
                local owned_jokers = {}
                for _, v in pairs(G.jokers.cards) do
                    if not self.ban_list[v.config.center_key] then
                        table.insert(owned_jokers, v.config.center_key)
                    end
                end
                new_key = pseudorandom_element(owned_jokers)
            else
                local adjacent_rarities = {}
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        if G.jokers.cards[i - 1] then
                            table.insert(adjacent_rarities, G.jokers.cards[i - 1].config.center.rarity)
                        end
                        if G.jokers.cards[i + 1] then
                            table.insert(adjacent_rarities, G.jokers.cards[i + 1].config.center.rarity)
                        end
                        break
                    end
                end
                local cham_filter = function(pool)
                        local all_unavailable = true
                        for _, v in ipairs(pool) do
                            if self.ban_list[v.key] then
                                v.key = "UNAVAILABLE"
                            else
                                all_unavailable = false
                            end
                        end
                        if all_unavailable then
                            pool[#pool+1] = {key = 'j_joker', type = "Joker"}
                        end
                        return pool
                end
                new_key = SMODS.poll_object({ type = 'Joker', rarities = adjacent_rarities, filter = cham_filter })
            end

            card.ability.mngy_fake_copy = Menagerie.fake_copy({
                fake_card = true,
                mngy_fake_copy = card,
                key = new_key,
                ability = copy_table(G.P_CENTERS[new_key].config),
                config = {
                    center = G.P_CENTERS[new_key]
                }
            })

            return {
                message = localize({type = 'name_text', set = 'Joker', key = card.ability.mngy_fake_copy.key}),
                func = function()
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.7,
                        func = function()
                            Card.add_to_deck(card.ability.mngy_fake_copy)
                            card:set_cost()
                            return true;
                        end
                    }))
                end
            }
        end

        if card.ability.mngy_fake_copy then
            local ret, trig = Card.calculate_joker(card.ability.mngy_fake_copy, context)
            if ret and ret.card and ret.card == card.ability.mngy_fake_copy then
                ret.card = card
            end
            return ret, trig
        end
    end,

    calc_dollar_bonus = function(self, card)
        if card.ability.mngy_fake_copy then
            Card.calculate_dollar_bonus(card.ability.mngy_fake_copy)
        end
    end,

    load = function(self, card, table, other)
        if table.mngy_fake_copy then
            local args = table.mngy_fake_copy
            args.mngy_fake_copy = card
            args.config.center = G.P_CENTERS[args.config.center]
            table.ability.mngy_fake_copy = Menagerie.fake_copy(args)
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if card.ability.mngy_fake_copy then
            Card.remove_from_deck(card.ability.mngy_fake_copy)
        end
    end,

    ban_list = {
        j_mngy_chameleon = true,
        j_mngy_inspiration = true
    }
}