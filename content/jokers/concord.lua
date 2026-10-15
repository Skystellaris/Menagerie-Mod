SMODS.Joker {
    key = 'concord',
    atlas = 'jokers',
    pos = { x = 0, y = 1 },
    rarity = 1,
    eternal_compat = false,
    config = {
        extra = {
            chips = -60,
            prob = 1,
            odds = 3
        }
    },

    loc_vars = function(self, info_queue, card)
        local num, den = SMODS.get_probability_vars(card, card.ability.extra.prob, card.ability.extra.odds)
        return { vars = { card.ability.extra.chips, num, den } }
    end,

    calculate = function(self, card, context)
        local stg = card.ability.extra
    
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'mngy_concord', card.ability.extra.prob, card.ability.extra.odds) then
                for i, v in ipairs(G.jokers.cards) do
                    if v == card then
                        if G.jokers.cards[i - 1] and not G.jokers.cards[i - 1].edition then
                            G.jokers.cards[i - 1]:set_edition(SMODS.poll_edition({ key = 'mngy_concord_edi', guaranteed = true }))
                        end
                        if G.jokers.cards[i + 1] and not G.jokers.cards[i + 1].edition then
                            G.jokers.cards[i + 1]:set_edition(SMODS.poll_edition({ key = 'mngy_concord_edi', guaranteed = true }))
                        end
                        break
                    end
                end
                SMODS.destroy_cards(card, {pinch_anim = true})
                G.GAME.pool_flags.mngy_concord_extinct = true
                return {
                    message = localize('k_extinct_ex')
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end
    end,
    in_pool = function(self, args)
        return not G.GAME.pool_flags.mngy_concord_extinct
    end
}