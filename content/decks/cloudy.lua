SMODS.Back {
    key = 'cloudy',
    atlas = 'decks',
    pos = { x = 8, y = 0 },
    config = {
        extra = {
            prob = 1,
            odds = 4,
            xmult = 2,
            state = 'cloudy'
        }
    },

    loc_vars = function(self, info_queue, back)
        local num, den = SMODS.get_probability_vars(back, self.config.extra.prob, self.config.extra.odds)

        if back.effect.config.extra.state == 'stormy' then
            info_queue[#info_queue+1] =  { key = 'b_mngy_cloudy', set = 'Back', specific_vars = {num, den} }
            return { key = 'b_mngy_stormy', vars = { num, den, self.config.xmult } }
        else
            info_queue[#info_queue+1] =  { key = 'b_mngy_stormy', set = 'Back', specific_vars = {num, den, self.config.extra.xmult} }
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
            if context.to_area == G.hand and SMODS.pseudorandom_probability(back, 'cloudy', self.config.prob, self.config.odds) then
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

        if context.individual and back.effect.config.extra.state == 'stormy' and context.other_card.facing == 'back' then
            return {
                xmult = self.config.xmult
            }
        end

        if context.destroying_card and back.effect.config.extra.state == 'stormy' and context.destroying_card.facing == 'back' then
            return {
                remove = true
            }
        end
    end,
}