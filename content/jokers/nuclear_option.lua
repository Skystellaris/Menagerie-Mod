SMODS.Joker {
    key = 'nuclear_option',
    atlas = 'placeholders',
    pos = { x = 2, y = 0 },
    rarity = 3,
    blueprint_compat = false,

    calculate = function(self, card, context)
        if context.setting_blind  and not card.getting_sliced then
                ease_discard(-(G.GAME.current_round.discards_left) + 1)
                return {
                    message = localize('k_mngy_kaboom')
                }
        end

        if context.discard then
            if not card.first_trigger then
                card.first_trigger = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(0.8, 0.8)
                        card.first_trigger = nil
                        return true;
                    end
                }))
            end
            return {
                remove = true
            }
        end
    end,
}