SMODS.Joker {
    key = 'cherry_on_top',
    atlas = 'jokers_common',
    pos = { x = 4, y = 0},
    rarity = 1,
    eternal_compat = false,
    config = {
        extra = {
            levels = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.levels } }
    end,

    calculate = function(self, card, context)
        local stg = card.ability.extra
    
        if context.end_of_round and context.main_eval and context.beat_boss then
            SMODS.smart_level_up_hand(card, G.GAME.last_hand_played, nil, card.ability.extra.levels)
            if not context.blueprint then
                SMODS.destroy_cards(card, {pinch_anim = true})
                return {
                    message = localize('k_eaten_ex')
                }
            end
        end
    end,
}