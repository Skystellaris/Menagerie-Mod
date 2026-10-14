SMODS.Joker {
    key = 'apprentice',
    atlas = 'jokers',
    pos = { x = 1, y = 0 },
    rarity = 1,
    config = {
        extra = {
            slots = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.slots } }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.modifiers.extra_boosters = G.GAME.modifiers.extra_boosters + card.ability.extra.slots
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.modifiers.extra_boosters = G.GAME.modifiers.extra_boosters - card.ability.extra.slots
    end,
}