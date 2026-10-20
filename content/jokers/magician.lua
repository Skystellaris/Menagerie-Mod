SMODS.Joker {
    key = 'magician',
    atlas = 'jokers_uncommon',
    pos = { x = 0, y = 0 },
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            vouchers = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.vouchers } }
    end,

    calculate = function(self, card, context)
        if context.starting_shop then
            for i = 1, card.ability.extra.vouchers do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up()
                        SMODS.add_voucher_to_shop(nil, true)
                        return true;
                    end
                }))
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        if G.STATE == G.STATES.SHOP then
            for i = 1, card.ability.extra.vouchers do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up()
                        SMODS.add_voucher_to_shop(nil, true)
                        return true;
                    end
                }))
            end
        end
    end,
}