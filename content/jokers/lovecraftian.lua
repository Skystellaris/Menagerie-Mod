SMODS.Joker {
    key = 'lovecraftian',
    atlas = 'jokers_rare',
    pos = { x = 3, y = 0 },
    rarity = 3,
    config = {
        extra = {
            sacrificed_set = nil,
            levels = 2,
        }
    },

    calculate = function(self, card, context)
        local stg = card.ability.extra
    
        if context.setting_blind then
            if not context.blueprint then
                local valid_cards = {}
                local area = next(G.consumeables.cards) and G.consumeables or G.jokers

                for _, v in pairs(area.cards) do
                    if not SMODS.is_eternal(v, card) and not v.getting_sliced and v ~= card then
                        valid_cards[#valid_cards+1] = v
                    end
                end

                local card_to_destroy = pseudorandom_element(valid_cards, 'mngy_lovecraft')

                if card_to_destroy and not card.getting_sliced then
                    card.ability.extra.sacrificed_set = card_to_destroy.ability.set
                    if card_to_destroy.config.center_key == 'c_soul' then
                        card.ability.extra.sacrificed_set = 'Soul'
                    end
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card:juice_up(0.8, 0.8)
                            SMODS.destroy_cards(card_to_destroy, {immediate = true})
                            return true;
                        end
                    }))
                end
            end

            if card.ability.extra.sacrificed_set == 'Joker' or card.ability.extra.sacrificed_set == 'Soul' then
                local edition = card.ability.extra.sacrificed_set == 'Soul' and 'e_negative' or SMODS.poll_edition({key = 'mngy_lovecraft_joker', guaranteed = true})
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card({set = 'Joker', edition = edition, rarity = card.ability.extra.sacrificed_set == 'Soul' and 'Legendary' or nil})
                        card.ability.extra.sacrificed_set = nil
                        return true;
                    end
                }))
            end
        end

        if context.before then
            if card.ability.extra.sacrificed_set == 'Planet' then
                card.ability.extra.sacrificed_set = nil
                return {
                    level_up = card.ability.extra.levels
                }
            end

            if card.ability.extra.sacrificed_set == 'Tarot' and not context.blueprint then
                card.ability.extra.sacrificed_set = nil

                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up()
                        return true;
                    end
                }))

                for _, v in pairs(context.scoring_hand) do
                    local cen_pool = {}
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center.key
                        end
                    end

                    local enhancement = SMODS.poll_enhancement { guaranteed = true, options = cen_pool, key = "mngy_lovecraft_tarot" }

                    v:set_ability(G.P_CENTERS[enhancement])
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up()
                            return true
                        end
                    }))
                end
            end

            if card.ability.extra.sacrificed_set == 'Spectral' and not context.blueprint then
                card.ability.extra.sacrificed_set = nil
                for _, v in ipairs(context.scoring_hand) do

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card:juice_up()
                            return true;
                        end
                    }))

                    if not v.seal and not v.mngy_lovecraft_sealed then
                        v.mngy_lovecraft_sealed = true
                        v:set_seal(SMODS.poll_seal({ guaranteed = true, type_key = 'mngy_lovecraft_spectral' }))

                        G.E_MANAGER:add_event(Event({
                            func = function()
                                v:juice_up()
                                card:juice_up()
                                v.mngy_lovecraft_sealed = nil
                                return true
                            end
                        }))
                    end
                end
            end
        end

        -- TARGET: Add crossmod effects here
    end,

}