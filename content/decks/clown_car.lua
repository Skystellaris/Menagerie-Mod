SMODS.Back {
    key = 'clown_car',
    atlas = 'decks',
    pos = { x = 5, y = 1 },
    config = {
        joker_slot = -4,
        extra = {
            bosses = {}
        }
    },

    loc_vars = function(self, info_queue, back)
        return {
            vars = {
                self.config.joker_slot
            }
        }
    end,

    calculate = function(self, back, context)
        if context.end_of_round and context.main_eval and context.beat_boss and back.effect.config.extra.primed then
            back.effect.config.extra.bosses[back.effect.config.extra.primed] = true
            back.effect.config.extra.primed = nil
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.jokers:change_size(1)
                    return true;
                end
            }))
            return {
                message = localize('k_mngy_plus_joker_slots')
            }
        end

        if context.setting_blind and context.blind.boss and not back.effect.config.extra.bosses[context.blind.key] then
            back.effect.config.extra.primed = context.blind.key
        end
    end,
}