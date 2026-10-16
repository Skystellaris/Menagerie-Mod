SMODS.Back {
    key = 'cloudy',
    atlas = 'placeholders',
    pos = { x = 4, y = 2 },
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

    calculate = function(self, back, context)
        if context.stay_flipped and SMODS.pseudorandom_probability(back, 'cloudy', self.config.prob, self.config.odds) then
            return {
                stay_flipped = true
            }
        end

        if context.individual and back.effect.config.extra.state == 'stormy' and context.other_card.facing == 'back' then
            
        end

    end,
}