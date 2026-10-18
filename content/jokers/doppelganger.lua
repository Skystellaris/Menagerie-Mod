SMODS.Joker {
    key = 'doppelganger',
    atlas = 'jokers_uncommon',
    pos = { x = 4, y = 1 },
    rarity = 2,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.blueprint then
            SMODS.calculate_effect({ message = localize('k_mngy_again_reversed'), colour = G.C.RED },card)
            SMODS.calculate_context({setting_blind = true, blind = G.GAME.round_resets.blind}) -- Jank lol
        end
    end,
}