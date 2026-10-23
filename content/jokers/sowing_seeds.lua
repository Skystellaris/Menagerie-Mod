SMODS.Joker {
    key = 'sowing_seeds',
    atlas = 'jokers_common',
    pos = { x = 8, y = 0 },
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    config = {
        extra = {
            ranks = {},
            rarity = 'Common'
        }
    },

    loc_vars = function(self, info_queue, card)
        local nodes = {}

        local built_string = localize('k_mngy_ranks_left')
        if SMODS.table_size(card.ability.extra.ranks) > 0 then
            
            local sorted_ranks = {}
            for _, v in pairs(card.ability.extra.ranks) do
                table.insert(sorted_ranks, v)
            end
            table.sort(sorted_ranks, function(a, b) return SMODS.Ranks[a].sort_id < SMODS.Ranks[b].sort_id end)

            local i = 0
            for _, v in ipairs(sorted_ranks) do
                i = i + 1
                built_string = built_string .. localize(v, 'ranks')
                if i < SMODS.table_size(sorted_ranks) then
                    built_string = built_string .. ', '
                    if string.len(built_string) > 30 then
                        table.insert(nodes, {
                            n = G.UIT.R,
                            config = { align = 'cm', padding = 0.06 },
                            nodes = {
                                {n = G.UIT.T, config = { colour = G.C.UI.TEXT_INACTIVE, scale = 0.26, text = built_string }}
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
                {n = G.UIT.T, config = { colour = G.C.UI.TEXT_INACTIVE, scale = 0.26, text = built_string }}
            }
        })

        local main_end = {{
            n = G.UIT.C,
            config = { align = 'cm'},
            nodes = nodes
        }}

        return { vars = { localize(card.ability.extra.rarity:lower(), 'labels'), colours = { SMODS.Rarities[card.ability.extra.rarity].badge_colour } }, main_end = main_end }
    end,

    set_ability = function(self, card, initial, delay_sprites)
        Menagerie.reset_seeds_ranks(card)
    end,

    calculate = function(self, card, context)
        if context.discard then
            if card.ability.extra.ranks[context.other_card.base.value] then
                SMODS.calculate_effect({ message = localize(card.ability.extra.ranks[context.other_card.base.value], 'ranks'), colour = G.C.ATTENTION, delay = 0.2 },card)
                card.ability.extra.ranks[context.other_card.base.value] = nil
                if SMODS.table_size(card.ability.extra.ranks) <= 0 then
                    Menagerie.reset_seeds_ranks(card)

                    local current_rarity_weight = SMODS.Rarities[card.ability.extra.rarity].default_weight
                    local next_rarity_weight = -1
                    local next_rarity_key = card.ability.extra.rarity
                    for k, v in pairs(SMODS.Rarities) do
                        if v.default_weight < current_rarity_weight and v.default_weight > next_rarity_weight then
                            next_rarity_key = v.key
                            next_rarity_weight = v.default_weight
                        end
                    end
                    if next_rarity_key ~= card.ability.extra.rarity then
                        card.ability.extra.rarity = next_rarity_key
                        return {
                            message = localize('k_upgrade_ex')
                        }
                    end
                end
            end
        end

        if context.selling_self then
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card({set = 'Joker', rarity = card.ability.extra.rarity})
                    return true;
                end
            }))
        end
    end,
}