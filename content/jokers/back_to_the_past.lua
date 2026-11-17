SMODS.Joker {
    key = 'back_to_the_past',
    atlas = 'placeholders',
    pos = { x = 2, y = 0 },
    rarity = 3,
    config = {
        extra = {
            chips = 88,
            antes = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.antes } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.after and SMODS.last_hand_oneshot then
            ease_ante(-card.ability.extra.antes)
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra.antes
            SMODS.destroy_cards(card)
            return {
                message = localize('k_mngy_going_back_ex')
            }
        end
    end,
}