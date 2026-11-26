SMODS.Joker {
    key = 'ace_up_the_sleeve',
    atlas = 'placeholders',
    pos = { x = 1, y = 0},
    rarity = 2,
    cost = 5,
    
    calculate = function(self, card, context)
        if context.before and context.scoring_name and not SMODS.PokerHands[context.scoring_name].visible then
            for _, v in pairs(context.scoring_hand) do
                if v:get_id() == 14 then
                    local pool = get_current_pool('Tag')
                    local i = 1
                    local tag_to_create = pseudorandom_element(pool, 'mngy_ace_sleeve'..i)
                    while tag_to_create == 'UNAVAILABLE' do
                        i = i + 1
                        tag_to_create = pseudorandom_element(pool, 'mngy_ace_sleeve'..i)
                    end
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            add_tag(Tag(tag_to_create))
                            play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                            play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                            card:juice_up()
                            return true;
                        end
                    }))
                    return nil, true
                end
            end
        end
    end,
}