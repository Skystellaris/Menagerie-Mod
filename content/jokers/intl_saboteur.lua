SMODS.Joker {
    key = 'intl_saboteur',
    atlas = 'placeholders',
    pos = { x = 1, y = 0},
    rarity = 2,
    cost = 8,
    config = {
        extra = {
            primed = false,
            percent = 25
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.percent } }
    end,

    calculate = function(self, card, context)
        if context.after and SMODS.last_hand_oneshot then
            card.ability.extra.primed = true
            local eval = function(_c) return _c.ability.extra.primed end
            G.E_MANAGER:add_event(Event({
                func = function()
                    juice_card_until(card, eval, true)
                    return true;
                end
            }))
            return {
                message = localize('k_mngy_loaded')
            }
        end

        if context.setting_blind and card.ability.extra.primed then
            card.ability.extra.primed = false
            return {
                xblindsize = (100 - card.ability.extra.percent)/100
            }
        end
    end,
}