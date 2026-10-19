Menagerie.mod.optional_features = function()
    return {
        retrigger_joker = true,
        quantum_enhancements = true,
    }
end

function Menagerie.reset_seeds_ranks(card)
    for k, v in pairs(SMODS.Ranks) do
        card.ability.extra.ranks[k] = v.key
    end
end

Menagerie.mod.calculate = function(self, context)
    if context.pseudorandom_result and not context.result then
        G.GAME.mngy_failed_prob_checks = (G.GAME.mngy_failed_prob_checks or 0) + 1
        check_for_unlock({type = 'mngy_run_failed_prob', amt = G.GAME.mngy_failed_prob_checks})
    end
end