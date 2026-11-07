SMODS.Suit {
    key = 'Shields',
    card_key = 'SHIELDS',

    lc_atlas = 'suits',
    lc_ui_atlas = 'ui_assets',
    lc_colour = Menagerie.C.MNGY_SHIELDS_LC,

    pos = { y = 0 },
    ui_pos = { x = 0, y = 0 },

    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.mngy_spawn_shields = true
                return true;
            end
        }))
    end,

    in_pool = function(self, args)
        if args and args.initial_deck then
            local back = G.GAME.selected_back
            local back_config = back and back.effect.center

            if back_config.include_shields then
                if not args.perfection_loop then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.mngy_spawn_shields = true
                            return true;
                        end
                    }))
                end
                return true
            end
        elseif G.GAME.mngy_spawn_shields then
            return true
        else
            return Menagerie.deck_has_shields()
        end
    end,
}