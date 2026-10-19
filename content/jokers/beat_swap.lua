SMODS.Joker {
    key = 'beat_swap',
    atlas = 'beat_swap',
    pos = { x = 2, y = 1 },
    sprite_args = {
        default_state = 'even',
        states = {
            even = {
                start_pos = { x = 2, y = 1 },
                fps = 1,
                frame_duration = 1
            },
            odd = {
                start_pos = { x = 3, y = 1 },
                fps = 1,
                frame_duration = 1
            },
        }
    },
    rarity = 2,
    config = {
        extra = {
            state = 'even',
            repetitions = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return { 
            key = self.key .. '_' .. card.ability.extra.state,
            vars = {
                card.ability.extra.repetitions,
                colours = {
                    card.ability.extra.state == 'even' and G.C.RED or G.C.BLUE,
                    card.ability.extra.state == 'even' and G.C.BLUE or G.C.RED,
                }
            } }
    end,

    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.state = pseudorandom_element({'even', 'odd'}, 'beat_swap_init')
    end,

    set_sprites = function(self, card, front)
        G.E_MANAGER:add_event(Event({
            func = function()
                card:set_sprite_state(card.ability.extra.state)
                return true;
            end
        }))
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if card.ability.extra.state == 'even' and not context.other_card:is_face() and context.other_card:get_id()%2 == 0 then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            elseif card.ability.extra.state == 'odd' and not context.other_card:is_face() and (context.other_card:get_id()%2 == 1 or context.other_card:get_id() == 14) then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end

        if context.after then
            if card.ability.extra.state == 'even' then
                card.ability.extra.state = 'odd'
            elseif card.ability.extra.state == 'odd' then
                card.ability.extra.state = 'even'
            end
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:flip()
                    return true;
                end
            }))
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:set_sprite_state(card.ability.extra.state)
                    return true;
                end
            }))
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:flip()
                    return true;
                end
            }))
            return {
                message = localize('k_swapped_ex')
            }
        end
    end,
}