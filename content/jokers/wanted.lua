SMODS.Joker {
    key = 'wanted',
    atlas = 'jokers_uncommon',
    pos = { x = 4, y = 0 },
    rarity = 2,
    config = {
        extra = {
            id = nil,
            rank = nil,
            suit = nil,
            dollars = 9,
        }
    },

    loc_vars = function(self, info_queue, card)
        if card.ability.extra.rank then
            return {
                key = 'j_mngy_wanted_target',
                vars = {
                    card.ability.extra.dollars,
                    card.ability.extra.rank,
                    card.ability.extra.suit,
                    colours = { G.C.SUITS[card.ability.extra.suit] }
                }
            }
        else
            return {
                vars = {
                    card.ability.extra.dollars,
                }
            }
        end
    end,

    calculate = function(self, card, context)
        if context.destroying_card and context.cardarea == G.play and context.destroying_card:get_id() == card.ability.extra.id and context.destroying_card:is_suit(card.ability.extra.suit) and not context.destroying_card.getting_sliced then

            SMODS.calculate_effect({ message = localize('k_mngy_bounty_redeemed_ex'), colour = G.C.ATTENTION }, card)
            return {
                dollars = card.ability.extra.dollars
            }
        end

        if context.discard and context.other_card:get_id() == card.ability.extra.id and context.other_card:is_suit(card.ability.extra.suit) then

            return {
                message = localize('k_mngy_bang_ex'),
                colour = G.C.RED,
                delay = 0.45,
                remove = true
            }
        end

        if context.setting_blind and not context.blueprint then
            Menagerie.wanted_choose_card(card)
            return {
                message = localize('k_reset')
            }
        end
    end,
}

SMODS.DrawStep {
    key = 'wanted',
    order = 41,
    func = function(self, layer)
        local wanteds = SMODS.find_card('j_mngy_wanted')
        if next(wanteds) and SMODS.is_playing_card(self) then
            if not Menagerie.targeted_sprite then
                Menagerie.targeted_sprite = Sprite(0, 0, G.CARD_W, G.CARD_H, G.ASSET_ATLAS['mngy_jokers_uncommon'], { x = 9, y = 0 })
            end

            for _, v in pairs(wanteds) do
                if self:get_id() == v.ability.extra.id and self:is_suit(v.ability.extra.suit) then
                    Menagerie.targeted_sprite.role.draw_major = self
                    Menagerie.targeted_sprite:draw_shader('dissolve', nil, nil, nil, self.children.center)
                    Menagerie.targeted_sprite:draw_shader('voucher', nil, self.ARGS.send_to_shader, nil, self.children.center)
                end
            end
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}
