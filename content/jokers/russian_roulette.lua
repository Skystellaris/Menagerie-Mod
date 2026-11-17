SMODS.Joker {
    key = 'russian_roulette',
    atlas = 'placeholders',
    pos = { x = 3, y = 1},
    rarity = 2,
    config = {
        extra = {
            prob = 1,
            odds = 6
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_death
        local num, den = SMODS.get_probability_vars(card, card.ability.extra.prob, card.ability.extra.odds)
        return { vars = { num, den } }
    end,

    calculate = function(self, card, context)
        if context.destroying_card and context.cardarea == G.play and SMODS.pseudorandom_probability(card, 'mngy_roulette_destroy', card.ability.extra.prob, card.ability.extra.odds) then
            return {
                remove = true,
                message = localize('k_mngy_bang_ex'),
            }
        end

        if context.setting_blind and SMODS.pseudorandom_probability(card, 'mngy_roulette_death', card.ability.extra.prob, card.ability.extra.odds) then
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card({key = 'c_death'})
                    play_sound('timpani')
                    card:juice_up(0.3, 0.5)
                    return true;
                end
            }))
            SMODS.destroy_cards(card)
            return {
                message = localize('k_mngy_bang_ex')
            }
        end
    end,
}