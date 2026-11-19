SMODS.Joker {
    key = 'egg_registry',
    atlas = 'placeholders',
    pos = { x = 3, y = 1},
    rarity = 2,
    config = {
        extra = {
            xmult = 0.1
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, 1 + (card.ability.extra.xmult * card.sell_cost) } }
    end,

    calculate = function(self, card, context)
        if context.mngy_gain_sell_val then
            card.ability.extra_value = (card.ability.extra_value or 0) + context.added_value
            card:set_cost()
            G.E_MANAGER:add_event(Event({
                func = function()
                    context.card:juice_up()
                    return true;
                end
            }))
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end

        if context.joker_main then
            return {
                xmult = 1 + (card.ability.extra.xmult * card.sell_cost)
            }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        for _, v in pairs(G.jokers.cards) do
            v.ability.mngy_egg_reg_track = v.ability.extra_value or 0
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if not next(SMODS.find_card('j_mngy_egg_registry')) then
            for _, v in pairs(G.jokers.cards) do
                v.ability.mngy_egg_reg_track = nil
            end
        end
    end,
}