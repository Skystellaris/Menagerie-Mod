SMODS.Joker {
    key = 'ante_beats',
    atlas = 'placeholders',
    pos = { x = 3, y = 1 },
    rarity = 2,
    config = {
        extra = {
            mult = 0,
            hand_sub = 1,
            discard_add = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.discard_add, card.ability.extra.hand_sub, card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            if card.ability.extra.mult ~= 0 then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "mult",
                    scalar_value = "hand_sub",
                    operation = function(ref_table, ref_value, initial, change)
                        ref_table[ref_value] = math.max(0, initial - change)
                    end,
                    message_key = 'a_mult_minus',
                    message_colour = G.C.RED
                })
                return nil, true
            end
        end

        if context.discard and not context.blueprint and context.other_card == context.full_hand[#context.full_hand] then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "mult",
                scalar_value = "discard_add"
            })
            return nil, true
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
}
