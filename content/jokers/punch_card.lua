SMODS.Joker {
    key = 'punch_card',
    atlas = 'punch_card',
    display_size = { w = 93, h = 69 },
    pixel_size = { w = 93, h = 69 },
    rarity = 3,
    config = {
        extra = {
            prob = 1,
            odds = 5,
            gain = 1,
            tag = 'tag_coupon'
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = { set = 'Tag', key = card.ability.extra.tag }
        info_queue[#info_queue+1] = { set = 'Other', key = 'mngy_empty' }
        local num, den = SMODS.get_probability_vars(card, card.ability.extra.prob, card.ability.extra.odds)
        return { vars = { num, den, localize{ set = 'Tag', type = 'name_text', key = card.ability.extra.tag }, card.ability.extra.gain } }
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            if SMODS.pseudorandom_probability(card, 'mngy_punch_card', card.ability.extra.prob, card.ability.extra.odds) then
                card.ability.extra.prob = 0
                G.E_MANAGER:add_event(Event({
                    func = function()
                        add_tag(Tag(card.ability.extra.tag))
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        card:juice_up()
                        return true;
                    end
                }))
            else
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'prob',
                    scalar_value = 'gain',
                    scaling_message = {
                        message = localize('k_mngy_punched_ex'),
                        colour = G.C.ATTENTION
                    }
                })
            end
        end
    end,
}