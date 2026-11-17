SMODS.Joker {
    key = 'shield_bearing',
    atlas = 'placeholders',
    pos = { x = 3, y = 1},
    rarity = 2,

    calculate = function(self, card, context)
        if context.check_eternal and SMODS.is_playing_card(context.other_card) and context.other_card:is_suit('mngy_Shields') then
            return {
                no_destroy = true
            }
        end

        if context.debuff_card and SMODS.is_playing_card(context.debuff_card) and context.debuff_card:is_suit('mngy_Shields') then
            return {
                prevent_debuff = true
            }
        end
    end,
}
