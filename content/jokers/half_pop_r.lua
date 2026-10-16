SMODS.Joker {
    key = 'half_pop_r',
    atlas = 'jokers',
    pos = { x = 7, y = 0},
    rarity = 1,
    eternal_compat = false,
    no_collection = true,
    config = {
        extra = {
            levels = 1,
            rounds = 1,
            hand = 'Pair'
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { localize(card.ability.extra.hand, 'poker_hands'), card.ability.extra.levels, card.ability.extra.rounds } }
    end,

    calculate = function(self, card, context)
        if context.before and context.scoring_name == card.ability.extra.hand then
            return {
                level_up = card.ability.extra.levels
            }
        end

        if context.end_of_round and context.main_eval and not context.blueprint then
            card.ability.extra.rounds = card.ability.extra.rounds - 1
            if card.ability.extra.rounds <= 0 then
                SMODS.destroy_cards(card, { pinch_anim = true })
                return {
                    message = localize('k_eaten_ex')
                }
            end
        end
    end,

    in_pool = function()
        return false
    end
}