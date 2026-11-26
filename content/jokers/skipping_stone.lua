SMODS.Joker {
    key = 'skipping_stone',
    atlas = 'placeholders',
    pos = { x = 1, y = 0},
    rarity = 2,
    cost = 8,

    calculate = function(self, card, context)
        if context.skip_blind then
            local chosen_tag = SMODS.poll_object({ type = 'Tag' })

            local times = 1
            if context.mngy_skipped_round == 'Big' and G.GAME.round_resets.blind_states.Small == 'Skipped' then
                times = times + 1
            end

            for i = 1, times do
                G.E_MANAGER:add_event(Event({
                    delay = .75,
                    trigger = 'after',
                    func = function()
                        card:juice_up(0.8, 0.8)
                        play_sound('generic1', math.random() * 0.2 + 0.9, 0.5)
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        add_tag(Tag(chosen_tag))
                        return true;
                    end
                }))
            end
        end
    end,
}