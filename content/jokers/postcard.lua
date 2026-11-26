SMODS.Joker {
    key = 'postcard',
    atlas = 'placeholders',
    pos = { x = 0, y = 0},
    rarity = 1,
    cost = 4,
    eternal_compat = false,
    config = {
        extra = {
            chips = 20
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.selling_self then
            G.GAME.mngy_postcard_sold_this_ante = true
            G.GAME.mngy_postcards_sold = G.GAME.mngy_postcards_sold + 1
            return {
                message = localize('k_upgrade_ex')
            }
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,

    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.chips = card.ability.extra.chips + ((G.GAME.mngy_postcards_sold or 0) * card.ability.extra.chips)
    end
}
