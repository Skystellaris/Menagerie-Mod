SMODS.Joker {
    key = 'cuckoo_egg',
    atlas = 'placeholders',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 0,
    config = {
        extra = {
            scalar = -3
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_egg
        return { vars = { card.ability.extra.scalar } }
    end,

    calculate = function(self, card, context)
        if context.scaling_card and context.card.config.center_key == 'j_egg' then
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:juice_up()
                    return true;
                end
            }))
            return {
                override_scalar = 0,
                override_message = {
                    message = localize('k_mngy_blocked_ex'),
                    colour = G.C.RED
                }
            }
        end

        if context.end_of_round and context.main_eval then
            SMODS.scale_card(card, {
                ref_table = card.ability,
                ref_value = "extra_value",
                scalar_table = card.ability.extra,
                scalar_value = "scalar",
                scaling_message = {
                    message = localize('k_mngy_val_down'),
                    colour = G.C.RED
                }
            })
            card:set_cost()
            return nil, true
        end
    end,

    in_pool = function(self, args)
        return false
    end
}
