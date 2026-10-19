SMODS.Joker {
    key = 'secret',
    atlas = 'jokers_rare',
    pos = { x = 9, y = 0 },
    rarity = 3,
    config = {
        extra = {
            xmult = 1.5,
            hands = {}
        }
    },
    
    calculate = function(self, card, context)
        if context.before and context.scoring_name and not SMODS.PokerHands[context.scoring_name].visible and not card.ability.extra.hands[context.scoring_name] then
            card.ability.extra.hands[context.scoring_name] = true
            return {
                message = localize('k_upgrade_ex')
            }
        end

        if context.joker_main and not SMODS.PokerHands[context.scoring_name].visible then
            return {
                xmult = card.ability.extra.xmult * SMODS.table_size(card.ability.extra.hands)
            }
        end
    end,
}