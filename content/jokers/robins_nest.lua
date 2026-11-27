SMODS.Joker {
    key = 'robins_nest',
    atlas = 'placeholders',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 6,
    config = {
        extra = {
            prob = 1,
            odds = 3
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_egg
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and context.beat_boss and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            local key = 'j_egg'
            if SMODS.pseudorandom_probability(card, 'mngy_robin_egg', card.ability.extra.prob, card.ability.extra.odds) then
                key = 'j_mngy_cuckoo_egg'
            end
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.joker_buffer = 0
                    SMODS.add_card({ key = key })
                    card:juice_up()
                    return true;
                end
            }))
        end
    end,
}
