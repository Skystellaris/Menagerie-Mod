SMODS.Enhancement {
    key = 'aurora',
    pos = { x = 1, y = 0 },

    calculate = function(self, card, context)
        if context.main_scoring and (context.cardarea == G.play or context.cardarea == G.hand and next(SMODS.find_card('j_mngy_stargazing'))) then
            G.GAME.mngy_aurora_scores = (G.GAME.mngy_aurora_scores or 0) + 1
            return {
                xmult = 1 + (G.GAME.mngy_aurora_scores * 0.1)
            }
        end

        if context.after then
            G.GAME.mngy_aurora_scores = 0
        end
    end,
}

SMODS.DrawStep { -- Derived from Ortalab
    key = 'aurora',
    order = 25,
    func = function(self, layer)
        if SMODS.has_enhancement(self, 'm_mngy_aurora') then
            if not Menagerie.aurora_sprite then
                Menagerie.aurora_sprite = Sprite(0, 0, G.CARD_W, G.CARD_H, G.ASSET_ATLAS['mngy_enhancements'],
                    { x = 2, y = 0 })
            end
            Menagerie.aurora_sprite.role.draw_major = self
            if self.edition and not self.delay_edition then
                for k, v in pairs(G.P_CENTER_POOLS.Edition) do
                    if self.edition[v.key:sub(3)] and v.shader then
                        if type(v.draw) == 'function' then
                            v:draw(self, layer)
                        else
                            Menagerie.aurora_sprite:draw_shader(v.shader, nil, self.ARGS.send_to_shader, nil,
                                self.children.center)
                        end
                    end
                end
                if self.edition.negative then
                    Menagerie.aurora_sprite:draw_shader('negative_shine', nil, self.ARGS.send_to_shader, nil,
                        self.children.center)
                end
            elseif not self:should_draw_base_shader() then
                -- Don't render base dissolve shader.
            elseif not self.greyed then
                Menagerie.aurora_sprite:draw_shader('dissolve', nil, nil, nil, self.children.center)
            end
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}
