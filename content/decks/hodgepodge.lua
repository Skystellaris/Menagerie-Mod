SMODS.Back {
    key = 'hodgepodge',
    atlas = 'decks',
    pos = { x = 3, y = 0 },

    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.mngy_hodgepodge = true
                G.GAME.mngy_first_hodge = true
                local _c = SMODS.add_card({set = 'Joker', rarity = 'Common'})
                _c:start_materialize()
                return true;
            end
        }))
    end,
}

SMODS.DrawStep {
    key = 'hodgepodge_back',
    order = 5,
    func = function(self)
        local back = (self.ability.set == "Back" and self.config.center)
			or (self.params.viewed_back == true and G.GAME.viewed_back and G.GAME.viewed_back.effect.center)
			or (self.playing_card and G.GAME.selected_back_key)

        if back and back.key == 'b_mngy_hodgepodge' then
            self.children.back:draw_shader('polychrome', nil, self.ARGS.send_to_shader, true)
        end
    end,
    conditions = { vortex = false, facing = 'back' }
}