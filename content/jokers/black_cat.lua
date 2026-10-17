SMODS.Joker {
    key = 'black_cat',
    atlas = 'jokers_rare',
    pos = { x = 1, y = 0 },
    rarity = 3,
    discovered = false,
    unlocked = false,
    config = {
        extra = {
            dollars = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,

    calculate = function(self, card, context)
        if context.pseudorandom_result and not context.result then
            return {
                dollars = card.ability.extra.dollars
            }
        end
    end,

    check_for_unlock = function(self, args)
        return args and args.type == 'mngy_run_failed_prob' and args.amt >= 3
    end
}