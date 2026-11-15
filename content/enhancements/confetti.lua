SMODS.Enhancement {
    key = 'confetti',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            xmult = 0.2
        },
    },

    loc_vars = function(self, info_queue, card)
        local highlighted = G.hand and #G.hand.highlighted or 1
        local num, denom = SMODS.get_probability_vars(card, 1, highlighted)
        return { vars = { card.ability.extra.xmult, num, denom } }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if not SMODS.pseudorandom_probability(card, 'mngy_confetti', 1, #context.full_hand) then
                return {
                    xmult = 1 + (card.ability.extra.xmult * #G.hand.cards)
                }
            else
                return {
                    message = localize('k_nope_ex'),
                    colour = G.C.SECONDARY_SET.Tarot,
                    sound = 'tarot2',
                    pitch = 0.76,
                }
            end
        end
    end,
}

SMODS.DrawStep { -- Derived from Ortalab
    key = 'confetti',
    order = 25,
    func = function(self, layer)
        if SMODS.has_enhancement(self, 'm_mngy_confetti') then
            if not Menagerie.confetti_sprite then
                Menagerie.confetti_sprite = Sprite(0, 0, G.CARD_W, G.CARD_H, G.ASSET_ATLAS['mngy_enhancements'],
                    { x = 3, y = 0 })
            end
            Menagerie.confetti_sprite.role.draw_major = self
            if self.edition and not self.delay_edition then
                for k, v in pairs(G.P_CENTER_POOLS.Edition) do
                    if self.edition[v.key:sub(3)] and v.shader then
                        if type(v.draw) == 'function' then
                            v:draw(self, layer)
                        else
                            Menagerie.confetti_sprite:draw_shader(v.shader, nil, self.ARGS.send_to_shader, nil,
                                self.children.center)
                        end
                    end
                end
                if self.edition.negative then
                    Menagerie.confetti_sprite:draw_shader('negative_shine', nil, self.ARGS.send_to_shader, nil,
                        self.children.center)
                end
            elseif not self:should_draw_base_shader() then
                -- Don't render base dissolve shader.
            elseif not self.greyed then
                Menagerie.confetti_sprite:draw_shader('dissolve', nil, nil, nil, self.children.center)
            end
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}
