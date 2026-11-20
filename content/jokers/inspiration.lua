SMODS.Joker {
    key = 'inspiration',
    atlas = 'placeholders',
    pos = { x = 3, y = 1},
    rarity = 2,

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
        if not card.fake_card then
            info_queue[#info_queue+1] = G.P_CENTERS.j_brainstorm
        end
        return { vars = { card.ability.mngy_fake_copy and localize({type = 'name_text', set = 'Joker', key = card.ability.mngy_fake_copy.key}) or localize('k_none') } }
    end,
    
    calculate = function(self, card, context)
        if context.starting_shop then
            if card.ability.mngy_fake_copy then
                Card.remove_from_deck(card.ability.mngy_fake_copy)
            end

            local new_key
            for _, v in pairs(G.shop_jokers.cards) do
                if v.ability.set == 'Joker' then
                    new_key = v.config.center_key
                    break
                end
            end
            if new_key then
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
            else
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:set_ability(G.P_CENTERS.j_brainstorm)
                        card.ability.mngy_inspired = true
                        return true;
                    end
                }))
                return {
                    message = localize('k_mngy_inspired')
                }
            end

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