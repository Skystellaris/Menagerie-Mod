SMODS.Joker {
    key = 'whos_that',
    atlas = 'placeholders',
    pos = { x = 3, y = 1},
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    
    calculate = function(self, card, context)
        if context.selling_self then

            local whos_that_filter = function(pool)
                local all_unavailable = true
                for _, v in pairs(pool) do
                    if G.GAME.mngy_seen_jokers[v.key] then
                        v.key = 'UNAVAILABLE'
                    else
                        all_unavailable = false
                    end
                end
                if all_unavailable then
                    pool[#pool+1] = {key = 'j_joker', type = "Joker"}
                end
                return pool
            end

            local chosen_key = SMODS.poll_object({type = 'Joker', filter = whos_that_filter })
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    SMODS.add_card({type = 'Joker', key = chosen_key})
                    return true
                end
            }))
        end
    end
}
