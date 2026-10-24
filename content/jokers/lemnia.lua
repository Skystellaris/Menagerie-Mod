SMODS.Joker {
    key = 'lemnia',
    atlas = 'jokers_common',
    pos = { x = 1, y = 1 },
    rarity = 1,
    eternal_compat = false,
    config = {
        extra = {
            prob = 1,
            odds = 600
        }
    },

    loc_vars = function(self, info_queue, card)
        local num, den = SMODS.get_probability_vars(card, card.ability.extra.prob, card.ability.extra.odds)
        return { vars = { num, den } }
    end,

    calculate = function(self, card, context)
        local stg = card.ability.extra

        if context.before then
            local adjacent_jokers = Menagerie.grapes_get_adjacent(card)
            
            if next(adjacent_jokers) then
                local joker_to_affect = pseudorandom_element(adjacent_jokers)

                if joker_to_affect.edition then
                    local unordered_options = get_current_pool("Edition", nil, nil, 'mngy_lemnia_edi')
                    local _options = {}
                    for _, edition in ipairs(unordered_options) do -- Flip the order of vanilla editions
                        if joker_to_affect.edition.key == edition then
                            -- Do nothing
                        elseif G.P_CENTERS[edition] and G.P_CENTERS[edition].vanilla then
                            table.insert(_options, 1, edition)
                        else
                            table.insert(_options, edition)
                        end
                    end
                    joker_to_affect:set_edition(SMODS.poll_edition({ key = 'mngy_lemnia_edi', guaranteed = true, options = _options }))
                else
                    joker_to_affect:set_edition(SMODS.poll_edition({ key = 'mngy_lemnia_edi', guaranteed = true }))
                end
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up()
                        return true;
                    end
                }))
            end
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'mngy_lemnia', card.ability.extra.prob, card.ability.extra.odds) then
                SMODS.destroy_cards(card, { pinch_anim = true })
                G.GAME.pool_flags.mngy_concord_extinct = true
                return {
                    message = localize('k_extinct_ex')
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end
    end,
    in_pool = function(self, args)
        return G.GAME.pool_flags.mngy_concord_extinct
    end
}
