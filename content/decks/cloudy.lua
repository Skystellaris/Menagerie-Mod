SMODS.Back {
    key = 'cloudy',
    atlas = 'cloudy-stormy',
    pos = { x = 0, y = 0 },
    sprite_args = {
        default_state = 'cloudy',
        states = {
            cloudy = {
                start_pos = { x = 0, y = 0 },
                fps = 1,
                frame_duration = 1
            },
            stormy = {
                start_pos = { x = 1, y = 0 },
                fps = 1,
                frame_duration = 1
            },
        },
        update_func = function(self, dt)
            self:set_state(G.GAME.mngy_cloudy == false and 'stormy' or 'cloudy')
        end
    },
    config = {
        extra = {
            prob = 1,
            odds = 4,
            xmult = 2,
        }
    },

    loc_vars = function(self, info_queue, back)
        local num, den = SMODS.get_probability_vars(back, self.config.extra.prob, self.config.extra.odds)

        if G.GAME.mngy_cloudy == false then
            return { key = 'b_mngy_stormy', vars = { num, den, self.config.xmult } }
        else
            return { vars = { num, den } }
        end
    end,

    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.mngy_cloudy = true
                return true;
            end
        }))
    end,

    calculate = function(self, back, context)
        if context.stay_flipped then
            if context.to_area == G.hand and SMODS.pseudorandom_probability(back, 'cloudy', self.config.extra.prob, self.config.extra.odds) then
                return {
                    stay_flipped = true
                }
            end

            if context.to_area == G.play then
                return {
                    stay_flipped = context.other_card.facing == 'back'
                }
            end
        end

        if context.destroying_card and G.GAME.mngy_cloudy == false and context.destroying_card.facing == 'back' then
            return {
                remove = true
            }
        end

        if context.has_rank and G.GAME.mngy_cloudy and context.card.facing == 'back' then
            return {
                any_rank = true
            }
        end

        if context.press_play and G.GAME.mngy_cloudy == false then
            for _, v in pairs(G.hand.highlighted) do
                if v.facing == 'back' then
                    v.ability.bonus = (v.ability.bonus or 0) - v.base.nominal
                    v.ability.x_mult = (v.ability.x_mult or 1) + (self.config.extra.xmult - 1)
                end
            end
        end

        if context.end_of_round and context.main_eval and context.beat_boss then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.mngy_cloudy = not G.GAME.mngy_cloudy
                    return true;
                end
            }))
            return {
                message = localize('k_swapped_ex')
            }
        end
    end,
}