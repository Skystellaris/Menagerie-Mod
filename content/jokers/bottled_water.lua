SMODS.Joker {
    key = 'bottled_water',
    atlas = 'jokers_common',
    pos = { x = 6, y = 1 },
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    config = {
        extra = {
            hands = 3,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.hands }
        }
    end,
    calculate = function(self, card, context)
        if context.selling_self and G.GAME.facing_blind then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    local hand_UI = G.HUD:get_UIE_by_ID('hand_UI_count')
                    G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + card.ability.extra.hands
                    hand_UI.config.object:update()
                    G.HUD:recalculate()
                    attention_text({
                        text = '+' .. card.ability.extra.hands,
                        scale = 0.8,
                        hold = 0.7,
                        cover = hand_UI.parent,
                        cover_colour = G.C.GREEN,
                        align = 'cm',
                    })
                    play_sound('chips2')
                    return true
                end
            }))
        end
    end
}
