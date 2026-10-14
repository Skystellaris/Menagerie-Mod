SMODS.Joker {
    key = 'twin_pop',
    atlas = 'jokers',
    pos = { x = 5, y = 0},
    rarity = 1,
    eternal_compat = false,
    config = {
        extra = {
            levels = 1,
            rounds = 2,
            hand = 'Two Pair'
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_mngy_half_pop_l
        info_queue[#info_queue+1] = G.P_CENTERS.j_mngy_half_pop_r

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
                    message = localize('k_melted_ex'),
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.add_card({ key = 'j_mngy_half_pop_l' })
                                SMODS.add_card({ key = 'j_mngy_half_pop_r' })
                                return true;
                            end
                        }))
                    end
                }
            else
                return {
                    message = card.ability.extra.rounds .. ''
                }
            end
        end
    end,
}