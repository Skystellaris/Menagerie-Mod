Menagerie.mod.optional_features = function()
    return {
        retrigger_joker = true,
        quantum_enhancements = true,
        object_weights = true,
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

function Menagerie.get_adjacent(card, func)
    local adjacent = {}
    for i = 1, #card.area.cards do
        if card.area.cards[i] == card then
            if card.area.cards[i - 1] and (not func or func and func(card.area.cards[i - 1])) then
                table.insert(adjacent, G.jokers.cards[i - 1])
            end
            if card.area.cards[i + 1] and (not func or func and func(card.area.cards[i - 1])) then
                table.insert(adjacent, card.area.cards[i + 1])
            end
            break
        end
    end
    return adjacent
end

function Menagerie.deck_has_shields()
    if G.playing_cards then
        for _, v in pairs(G.playing_cards) do
            if v.base.suit == 'mngy_Shields' then
                return true
            end
        end
    end
    return false
end

function Menagerie.hodgepodge_get_guaranteed_sticker(card)
    local valid_stickers = {}
    local center = card.config.center
    for k, v in pairs(SMODS.Stickers) do
        if v.key ~= 'pinned' and
            (center[v.key..'_compat'] or -- explicit marker
            (
                center[v.key..'_compat'] == nil and
                ((v.default_compat and not v.compat_exceptions[center.key]) or -- default yes with no exception
                (not v.default_compat and v.compat_exceptions[center.key]))
            )) -- default no with exception
        then
            table.insert(valid_stickers, v.key)
        end
    end
    return pseudorandom_element(valid_stickers)
end

Menagerie.mod.calculate = function(self, context)
    if context.pseudorandom_result and not context.result then
        G.GAME.mngy_failed_prob_checks = (G.GAME.mngy_failed_prob_checks or 0) + 1
        check_for_unlock({ type = 'mngy_run_failed_prob', amt = G.GAME.mngy_failed_prob_checks })
    end

    if context.individual and context.cardarea == G.play and context.other_card.lucky_trigger and not G.GAME.pool_flags.mngy_lucky_hit_flag then
        G.GAME.pool_flags.mngy_lucky_hit_flag = true
    end

    if context.setting_blind and next(SMODS.find_card('j_mngy_yield')) then
        G.GAME.mngy_yield_this_round = true
    end

    if context.round_eval and G.GAME.mngy_yield_this_round then
        G.GAME.mngy_yield_this_round = nil
    end

    if context.before then
        G.GAME.mngy_hands_this_ante[context.scoring_name] = true
        if not SMODS.PokerHands[context.scoring_name].visible then
            G.GAME.pool_flags.mngy_secret_hand_played = true
        end
    end

    if context.pseudorandom_result and context.identifier == 'wheel_of_fortune' and context.numerator == 0 then
        check_for_unlock({ type = 'mngy_nope' })
    end

    if context.remove_playing_cards then
        local jack_tally = 0
        for _, v in pairs(context.removed) do
            if v:get_id() == 11 then
                jack_tally = jack_tally + 1
            end
            if jack_tally >= 4 then
                check_for_unlock({ type = 'mngy_jacks' })
                break
            end
        end
    end

    if context.individual and context.other_card.repetition_trigger then
        check_for_unlock({type = 'mngy_retriggers', retriggers = context.other_card.repetition_trigger, card = context.other_card})
    end

    if context.selling_card and context.card.config.center_key == 'j_egg' and context.card.sell_cost >= 50 then
        check_for_unlock({ type = 'mngy_expensive' })
    end

    if context.money_altered and context.amount > 0 and G.GAME.dollars > 10 then
        G.GAME.mngy_failed_loan_shark = true
    end

    if context.repetition and context.other_card then
        for i, v in ipairs(context.other_card.area.cards) do
            if v == context.other_card then
                if not SMODS.has_enhancement(context.other_card, 'm_mngy_doodle') then
                    local reps_triggers = {}
                    if context.other_card.area.cards[i - 1] and SMODS.has_enhancement(context.other_card.area.cards[i - 1], 'm_mngy_doodle') then
                        local doodle = context.other_card.area.cards[i - 1]
                        if SMODS.pseudorandom_probability(doodle, 'mngy_doodle', doodle.ability.extra.prob, doodle.ability.extra.odds) then
                            reps_triggers[#reps_triggers+1] = {repetitions = doodle.ability.extra.retriggers, message_card = doodle}
                        end
                    end
                    if context.other_card.area.cards[i + 1] and SMODS.has_enhancement(context.other_card.area.cards[i + 1], 'm_mngy_doodle') then
                        local doodle = context.other_card.area.cards[i + 1]
                        if SMODS.pseudorandom_probability(doodle, 'mngy_doodle', doodle.ability.extra.prob, doodle.ability.extra.odds) then
                            reps_triggers[#reps_triggers+1] = {repetitions = doodle.ability.extra.retriggers, message_card = doodle}
                        end
                    end
                    if #reps_triggers > 0 then
                        return SMODS.merge_effects(reps_triggers)
                    end
                end
                break
            end
        end
    end

    if context.ante_change and context.ante_end then
        G.GAME.mngy_hands_last_ante = copy_table(G.GAME.mngy_hands_this_ante)
        G.GAME.mngy_hands_this_ante = {}

        if G.GAME.mngy_postcard_sold_this_ante then
            G.GAME.mngy_postcard_sold_this_ante = nil
            G.GAME.mngy_postcard_primed = true
        end
    end

    if context.create_shop_card and G.GAME.mngy_postcard_primed then
        G.GAME.mngy_postcard_primed = nil
        return {
            shop_create_flags = {
                key = 'j_mngy_postcard'
            }
        }
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

function Menagerie.are_cards_colliding(card1_T, card2_T)
    return card1_T.x < card2_T.x + card2_T.w and
           card2_T.x < card1_T.x + card1_T.w and
           card1_T.y < card2_T.y + card2_T.h and
           card2_T.y < card1_T.y + card1_T.h
end
