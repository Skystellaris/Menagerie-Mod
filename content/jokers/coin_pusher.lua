SMODS.Joker {
    key = 'coin_pusher',
    atlas = 'jokers_uncommon',
    pos = { x = 6, y = 1 },
    rarity = 2,
    unlocked = false,
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
        info_queue[#info_queue+1] = G.P_SEALS.Gold

        return { vars = { card.ability.extra.dollars, card.ability.extra.discarded, card.ability.extra.goal, colours = { card.ability.extra.active and G.C.GREEN or G.C.RED } } }
    end,

    calculate = function(self, card, context)
        if context.pre_discard and card.ability.extra.active then
            card.ability.extra.active = false
            card.ability.extra.discarded = 0
            for _, v in pairs(context.full_hand) do
                G.E_MANAGER:add_event(Event({
                    delay = 0.25,
                    trigger = 'after',
                    func = function()
                        v:set_seal('Gold', nil, true)
                        v:juice_up()
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
            if SMODS.has_enhancement(context.other_card, 'm_gold') then
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

    check_for_unlock = function(self, args)
        if args and args.type == 'discard_custom' then
            local gold_tally = 0
            for i = 1, #args.cards do
                if SMODS.has_enhancement(args.cards[i], 'm_gold') then
                    gold_tally = gold_tally + 1
                end
            end
            if gold_tally >= 5 then
                return true
            end
        end
        return false
    end
}
