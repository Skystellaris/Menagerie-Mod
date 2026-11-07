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
            hand_played = true,
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
        if context.before and next(context.poker_hands[card.ability.extra.hand]) then
            card.ability.extra.hand_played = true
            local eval = function(_c) return (not _c.ability.hand_played) and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
            return {
                message = localize('k_active_ex')
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
                card.ability.extra.hand_played = false
                return true;
            end
        }))

        if card.ability.extra.hand_played then
            return card.ability.extra.dollars
        end
    end
}