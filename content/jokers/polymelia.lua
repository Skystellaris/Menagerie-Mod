SMODS.Joker {
    key = 'polymelia',
    atlas = 'placeholders',
    pos = { x = 3, y = 1},
    rarity = 2,
    config = {
        extra = {
            limit = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.limit } }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                SMODS.change_play_limit(card.ability.extra.limit)
                SMODS.change_discard_limit(card.ability.extra.limit)
                return true;
            end
        }))
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                SMODS.change_play_limit(-card.ability.extra.limit)
                SMODS.change_discard_limit(-card.ability.extra.limit)
                return true;
            end
        }))
    end,
}