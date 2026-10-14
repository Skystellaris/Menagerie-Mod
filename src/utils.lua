Menagerie.mod.optional_features = function()
    return {
        retrigger_joker = true
    }
end

function Menagerie.reset_seeds_ranks(card)
    for k, v in pairs(SMODS.Ranks) do
        card.ability.extra.ranks[k] = v.key
    end
end