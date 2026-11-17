SMODS.Joker {
    key = 'poodle',
    atlas = 'placeholders',
    pos = { x = 3, y = 1},
    rarity = 2,
    config = {
        extra = {
            chips = 125
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.after and SMODS.last_hand_oneshot then
            SMODS.destroy_cards(card)
            return {
                message = localize('k_mngy_popped_ex')
            }
        end
    end,
}