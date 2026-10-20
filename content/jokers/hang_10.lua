SMODS.Joker {
    key = 'hang_10',
    atlas = 'jokers_uncommon',
    pos = { x = 8, y = 0 },
    rarity = 2,
    config = {
        extra = {
            prob = 1,
            odds = 10,
            gain = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_hanged_man
        local num, den = SMODS.get_probability_vars(card, card.ability.extra.prob, card.ability.extra.odds)

        return { vars = { num, den, card.ability.extra.gain, localize { set = 'Tarot', type = 'name_text', key = 'c_hanged_man' } } }
    end,

    calculate = function(self, card, context)
        if context.after and SMODS.pseudorandom_probability(card, 'mngy_hang_10', card.ability.extra.prob, card.ability.extra.odds) and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.consumeable_buffer = 0
                    SMODS.add_card({ key = 'c_hanged_man' });
                    (context.blueprint_card or card):juice_up()
                    return true;
                end
            }))
            return nil, true
        end

        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 10 and not context.blueprint then
            local _c = context.other_card
            G.E_MANAGER:add_event(Event({
                func = function()
                    _c:juice_up()
                    return true;
                end
            }))
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = 'prob',
                scalar_value = 'gain',
            })
        end

        if context.end_of_round and context.main_eval and not context.blueprint then
            card.ability.extra.prob = 1
            return {
                message = localize('k_reset')
            }
        end
    end,
}
