SMODS.Joker {
    key = 'jeanie',
    atlas = 'placeholders',
    pos = { x = 3, y = 1},
    rarity = 2,
    config = {
        extra = {
            hands_played = 0,
            chips = 51,
            mult = 15,
            money = 5
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult,  card.ability.extra.money } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if card.ability.extra.hands_played % 3 == 0 then
                return {
                    dollars = card.ability.extra.money,
                }
            elseif card.ability.extra.hands_played % 3 == 2 then
                return {
                    mult = card.ability.extra.mult
                }
            else
                return {
                    chips = card.ability.extra.chips
                }
            end
        end

        if context.before and (not context.blueprint or not context.retrigger_joker) then
            card.ability.extra.hands_played = card.ability.extra.hands_played + 1
        end
    end
}
