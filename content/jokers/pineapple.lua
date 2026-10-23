SMODS.Joker {
    key = 'pineapple',
    atlas = 'jokers_common',
    pos = { x = 2, y = 1 },
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    config = {
        extra = {
            hand = 'Three of a Kind',
            consistent_hand = true,
            dollars = 9,
            prob = 1,
            odds = 3
        }
    },

    loc_vars = function(self, info_queue, card)
        local num, den = SMODS.get_probability_vars(card, card.ability.extra.prob, card.ability.extra.odds)
        return { vars = { card.ability.extra.dollars, localize(card.ability.extra.hand, 'poker_hands'), num, den } }
    end,

    calculate = function(self, card, context)
        if context.before and context.scoring_name ~= card.ability.extra.hand and card.ability.extra.consistent_hand then
            card.ability.extra.consistent_hand = false
            return {
                message = localize('k_nope_ex'),
                colour = G.C.SECONDARY_SET.Tarot,
                sound = 'tarot2',
                pitch = 0.76,
                volume = 0.4
            }
        end

        if context.round_eval then
            if SMODS.pseudorandom_probability(card, 'mngy_pineapple', card.ability.extra.prob, card.ability.extra.odds) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.destroy_cards(card, {pinch_anim = true, immediate = true})
                        SMODS.calculate_effect({ message = localize('k_eaten_ex'), instant = true },card)
                        return true;
                    end
                }))
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end
    end,

    calc_dollar_bonus = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                card.ability.extra.consistent_hand = true
                return true;
            end
        }))

        if card.ability.extra.consistent_hand then
            return card.ability.extra.dollars
        end
    end
}