SMODS.Joker {
    key = 'coffee',
    atlas = 'jokers',
    pos = { x = 3, y = 0},
    rarity = 1,
    config = {
        extra = {
            retriggers = 5
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.retriggers } }
    end,

    calculate = function(self, card, context)
        local stg = card.ability.extra
    
        if context.retrigger_joker_check and card.ability.extra.retriggers > 0 then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    if G.jokers.cards[i - 1] and G.jokers.cards[i - 1] == context.other_card then
                        return {
                            repetitions = 1
                        }
                    end
                    break
                end
            end
        end

        if context.after then
            card.ability.extra.retriggers = card.ability.extra.retriggers - 1
            if card.ability.extra.retriggers <= 0 then
                SMODS.destroy_cards(card, {pinch_anim = true})
                return {
                    message = localize('k_mngy_drank_ex')
                }
            end
        end
    end,
}