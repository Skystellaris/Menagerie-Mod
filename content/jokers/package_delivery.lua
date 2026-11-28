SMODS.Joker {
    key = 'package_delivery',
    atlas = 'placeholders',
    pos = { x = 1, y = 0 },
    rarity = 2,
    cost = 7,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1

            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.consumeable_buffer = 0
                    SMODS.add_card({set = 'Consumeables'})
                    return true;
                end
            }))

            return {
                message = localize('k_mngy_delivery_ex')
            }
        end
    end,
}