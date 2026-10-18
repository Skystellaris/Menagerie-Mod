SMODS.Joker {
    key = 'hang_10',
    atlas = 'jokers_uncommon',
    pos = { x = 9, y = 0 },
    rarity = 2,
    config = {
        extra = {
            prob = 1,
            odds = 10,
            gain = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_hanged_man
        local num, den = SMODS.get_probability_vars(card, card.ability.extra.prob, card.ability.extra.odds)

        return { vars = { num, den, card.ability.extra.gain, localize { set = 'Tarot', type = 'name_text', key = 'c_hanged_man' } } }
    end,

    calculate = function(self, card, context)
        if context.before then
            if not context.blueprint then
                for _, v in pairs(context.scoring_hand) do
                    if v:get_id() == 10 then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                v:juice_up()
                                return true;
                            end
                        }))
                        SMODS.scale_card(card, {
                            ref_table = card.ability.extra,
                            ref_value = 'prob',
                            scalar_value = 'gain',
                        })
                    end
                end
            end

            if SMODS.pseudorandom_probability(card, 'mngy_hang_10', card.ability.extra.prob, card.ability.extra.odds) and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.joker_buffer = 0
                        SMODS.add_card({ key = 'c_hanged_man' });
                        (context.blueprint_card or card):juice_up()
                        return true;
                    end
                }))
            end
        end

        if context.end_of_round and context.main_eval and not context.blueprint then
            card.ability.extra.prob = 1
            return {
                message = localize('k_reset')
            }
        end
    end,
}