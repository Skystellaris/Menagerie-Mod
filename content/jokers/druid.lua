SMODS.Joker {
    key = 'druid',
    atlas = 'jokers_uncommon',
    pos = { x = 1, y = 0 },
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            interest = 1,
            hand_dollars = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hand_dollars, card.ability.extra.interest } }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.modifiers.money_per_hand = (G.GAME.modifiers.money_per_hand or 1) + card.ability.extra.hand_dollars
        G.GAME.interest_cap = G.GAME.interest_cap - (card.ability.extra.interest * 5)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.modifiers.money_per_hand = G.GAME.modifiers.money_per_hand - card.ability.extra.hand_dollars
        G.GAME.interest_cap = G.GAME.interest_cap + (card.ability.extra.interest * 5)
    end,
}