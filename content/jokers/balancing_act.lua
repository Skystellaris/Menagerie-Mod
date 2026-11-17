SMODS.Joker {
    key = 'balancing_act',
    atlas = 'placeholders',
    pos = { x = 3, y = 1},
    rarity = 2,
    
    calculate = function(self, card, context)
        if context.final_scoring_step and context.scoring_name == 'Two Pair' then
            return {
                balance = true
            }
        end
    end,
}