SMODS.Joker {
    key = 'earthworm',
    atlas = 'placeholders',
    pos = { x = 0, y = 0},
    rarity = 1,
    cost = 4,
    config = {
        extra = {
            xchips = 1.25,
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xchips } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.hands_played == 0 then
            return {
                xchips = card.ability.extra.xchips
            }
        end

        if context.modify_weights and context.pool_types['Joker'] and context.pool['j_mngy_robins_nest'] and context.args and context.args.append == 'sho' then
            context.pool['j_mngy_robins_nest'].weight = context.pool['j_mngy_robins_nest'].weight * 10
        end
    end,
}