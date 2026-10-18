SMODS.Joker {
    key = 'coin_pusher',
    atlas = 'jokers_uncommon',
    pos = { x = 6, y = 1 },
    rarity = 2,
    config = {
        extra = {
            dollars = 2,
            discarded = 0,
            goal = 5,
            active = false
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_gold

        return { vars = { card.ability.extra.dollars, card.ability.extra.discarded, card.ability.extra.goal, colours = { card.ability.extra.active and G.C.GREEN or G.C.RED } } }
    end,

    calculate = function(self, card, context)
        if context.pre_discard and card.ability.extra.active then
            card.ability.extra.active = false
            card.ability.extra.discarded = 0
            for _, v in pairs(context.full_hand) do
                v.mngy_pusher_gold = true
                v:set_ability(G.P_CENTERS.m_gold, nil, true)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        v:juice_up()
                        v.mngy_pusher_gold = nil
                        return true
                    end
                }))
            end
            return {
                message = localize('k_gold'),
                colour = G.C.MONEY,
            }
        end

        if context.discard then
            if SMODS.has_enhancement(context.other_card, 'm_gold') and not context.other_card.mngy_pusher_gold then
                card.ability.extra.discarded = card.ability.extra.discarded + 1
                return {
                    dollars = card.ability.extra.dollars,
                    delay = 0.2,
                    func = function()
                        if card.ability.extra.discarded >= card.ability.extra.goal and not card.ability.extra.active then
                            card.ability.extra.active = true
                            SMODS.calculate_effect({ message = localize('k_active_ex'), colour = G.C.GREEN }, card)
                        end
                    end
                }
            end
        end
    end,
}
