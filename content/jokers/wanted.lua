SMODS.Joker {
    key = 'wanted',
    atlas = 'jokers_uncommon',
    pos = { x = 4, y = 0 },
    rarity = 2,
    config = {
        extra = {
            id = nil,
            rank = nil,
            suit = nil,
            dollars = 9,
        }
    },

    loc_vars = function(self, info_queue, card)
        if card.ability.extra.rank then
            return {
                key = 'j_mngy_wanted_target',
                vars = {
                    card.ability.extra.dollars,
                    card.ability.extra.rank,
                    card.ability.extra.suit,
                    colours = { G.C.SUITS[card.ability.extra.suit] }
                }
            }
        else
            return {
                vars = {
                    card.ability.extra.dollars,
                }
            }
        end
    end,

    calculate = function(self, card, context)
        if context.destroying_card and context.cardarea == G.play and context.destroying_card:get_id() == card.ability.extra.id and context.destroying_card:is_suit(card.ability.extra.suit) and not context.destroying_card.getting_sliced then
            if not context.blueprint then
                Menagerie.wanted_choose_card(card)
            end
            SMODS.calculate_effect({ message = localize('k_mngy_bounty_redeemed_ex'), colour = G.C.ATTENTION }, card)
            return {
                dollars = card.ability.extra.dollars
            }
        end

        if context.discard and context.other_card:get_id() == card.ability.extra.id and context.other_card:is_suit(card.ability.extra.suit) then
            if not context.blueprint then
                Menagerie.wanted_choose_card(card)
            end
            return {
                message = localize('k_mngy_bang_ex'),
                colour = G.C.RED,
                delay = 0.45,
                remove = true
            }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        Menagerie.wanted_choose_card(card)
    end
}
