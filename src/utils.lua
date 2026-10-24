Menagerie.mod.optional_features = function()
    return {
        retrigger_joker = true,
        quantum_enhancements = true,
    }
end

function Menagerie.reset_seeds_ranks(card)
    for k, v in pairs(SMODS.Ranks) do
        card.ability.extra.ranks[k] = v.key
    end
end

function Menagerie.wanted_choose_card(card)
    local chosen_card = pseudorandom_element(G.playing_cards, pseudoseed('wanted' .. G.GAME.round_resets.ante))
    card.ability.extra.id = chosen_card:get_id()
    card.ability.extra.rank = SMODS.Ranks[chosen_card.base.value].key
    card.ability.extra.suit = chosen_card.base.suit
end

function Menagerie.grapes_get_adjacent(card)
    local adjacent = {}
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
            if G.jokers.cards[i - 1] and not G.jokers.cards[i - 1].edition then
                table.insert(adjacent, G.jokers.cards[i - 1])
            end
            if G.jokers.cards[i + 1] and not G.jokers.cards[i + 1].edition then
                table.insert(adjacent, G.jokers.cards[i + 1])
            end
            break
        end
    end
    return adjacent
end

Menagerie.mod.calculate = function(self, context)
    if context.pseudorandom_result and not context.result then
        G.GAME.mngy_failed_prob_checks = (G.GAME.mngy_failed_prob_checks or 0) + 1
        check_for_unlock({ type = 'mngy_run_failed_prob', amt = G.GAME.mngy_failed_prob_checks })
    end

    if context.individual and context.cardarea == G.play and context.other_card.lucky_trigger and not G.GAME.pool_flags.mngy_lucky_hit_flag then
        G.GAME.pool_flags.mngy_lucky_hit_flag = true
    end
end

Menagerie.mod.menu_cards = function()
    if Menagerie.mod.config.menu and G.P_CENTERS['j_mngy_jollibee'] then
        return {
            { key = 'j_mngy_jollibee' }
        }
    end
end

Menagerie.mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = { align = "m", r = 0.1, padding = 0.1, colour = G.C.BLACK, minw = 8, minh = 6 },
        nodes = {
            { n = G.UIT.R, config = { align = "cl", padding = 0, minh = 0.1 }, nodes = {} },

            -- Custom Menu Toggle
            {
                n = G.UIT.R,
                config = { align = "cl", padding = 0 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "cl", padding = 0.05 },
                        nodes = {
                            create_toggle { col = true, label = "", scale = 1, w = 0, shadow = true, ref_table = Menagerie.mod.config, ref_value = "menu" },
                        }
                    },
                    {
                        n = G.UIT.C,
                        config = { align = "c", padding = 0 },
                        nodes = {
                            { n = G.UIT.T, config = { text = localize('b_mngy_custom_menu'), scale = 0.45, colour = G.C.UI.TEXT_LIGHT } },
                        }
                    },
                }
            },

            -- Negative Score Toggle
            {
                n = G.UIT.R,
                config = { align = "cl", padding = 0 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "cl", padding = 0.05 },
                        nodes = {
                            create_toggle { col = true, label = "", scale = 1, w = 0, shadow = true, ref_table = Menagerie.mod.config, ref_value = "disable_negative_score" },
                        }
                    },
                    {
                        n = G.UIT.C,
                        config = { align = "c", padding = 0 },
                        nodes = {
                            { n = G.UIT.T, config = { text = localize('b_mngy_disable_negative_score'), scale = 0.45, colour = G.C.UI.TEXT_LIGHT } },
                        }
                    },
                }
            },

        }
    }
end
