SMODS.Joker {
    key = 'apprentice',
    atlas = 'jokers',
    pos = { x = 1, y = 0 },
    rarity = 1,
    blueprint_compat = false,
    config = {
        extra = {
            packs = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.packs } }
    end,

    calculate = function(self, card, context)
        if context.starting_shop then
            for i = 1, card.ability.extra.packs do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up()
                        SMODS.add_booster_to_shop()
                        return true;
                    end
                }))
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        if G.STATE == G.STATES.SHOP then
            for i = 1, card.ability.extra.packs do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up()
                        SMODS.add_booster_to_shop()
                        return true;
                    end
                }))
            end
        end
    end,
}