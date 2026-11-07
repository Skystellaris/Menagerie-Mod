SMODS.Joker({
    key = 'astral_projection',
    atlas = 'jokers_common',
    pos = { x = 8, y = 1 },
    rarity = 1,
    config = {
        extra = {
            astral_proj = 3
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.astral_proj } }
    end,

    add_to_deck = function(self, card, from_debuff)
        if from_debuff then return end
        G.GAME.astral_proj_amount = (G.GAME.astral_proj_amount or 0) + card.ability.extra.astral_proj
    end,

    remove_from_deck = function(self, card, from_debuff)
        if from_debuff then return end
        G.GAME.astral_proj_amount = math.max(0, (G.GAME.astral_proj_amount or 0) - card.ability.extra.astral_proj)
    end,
})

-- astral_proj helpers
if type(create_astral_proj_cardarea) ~= 'function' then
    create_astral_proj_cardarea = function()
        local config = { card_limit = 0, type = 'astral_proj' }
        config.major = G.deck
        local astral_proj_view = CardArea(0, 0, 2 * G.CARD_W, 0.5 * G.CARD_H, config)
        astral_proj_view.T.x = G.TILE_W - G.deck.T.w / 2 - astral_proj_view.T.w / 2 - 0.4
        astral_proj_view.T.y = G.TILE_H - G.deck.T.h - astral_proj_view.T.h
        astral_proj_view:hard_set_VT()
        G.GAME.astral_proj_amount = G.GAME.astral_proj_amount or 0
        return astral_proj_view
    end
end

if type(hide_astral_proj_cardarea) ~= 'function' then
    hide_astral_proj_cardarea = function()
        G.astral_proj_view.states.visible = false
        for i = #G.astral_proj_view.cards, 1, -1 do
            G.astral_proj_view.cards[i]:remove()
        end
    end
end

if type(update_astral_proj_cardarea) ~= 'function' then
    local function cards_dont_match(c1, c2)
        if type(c1) ~= type(c2) then return true end
        if c1.config.center ~= c2.config.center then return true end
        if c1.config.card_key ~= c2.config.card_key then return true end
        if c1.base.name ~= c2.base.name then return true end
        if c1.base.suit ~= c2.base.suit then return true end
        if c1.base.value ~= c2.base.value then return true end
        if type(c1.edition) ~= type(c2.edition) then return true end
        if c1.edition and c1.edition.type ~= c2.edition.type then return true end
        if c1.seal ~= c2.seal then return true end
        if c1.debuff ~= c2.debuff then return true end
        if c1.pinned ~= c2.pinned then return true end
        return false
    end

    update_astral_proj_cardarea = function(astral_proj_view)
        if not astral_proj_view.states.visible then
            for i = #astral_proj_view.cards, 1, -1 do astral_proj_view.cards[i]:remove() end
            astral_proj_view.states.visible = true
        end
        if astral_proj_view.children.area_uibox then
            astral_proj_view.children.area_uibox.states.visible = false
        end
        if astral_proj_view.adjusting_cards then return end
        astral_proj_view.adjusting_cards = true

        local deck = {}
        for i = 1, G.GAME.astral_proj_amount do
            if #G.deck.cards + 1 <= i then break end
            deck[i] = G.deck.cards[#G.deck.cards + 1 - i]
        end
        deck[G.GAME.astral_proj_amount + 1] = true

        local i = 1
        for k, card in pairs(deck) do
            while i <= #astral_proj_view.cards and cards_dont_match(card, astral_proj_view.cards[i]) do
                astral_proj_view.cards[i]:start_dissolve({ G.C.PURPLE })
                i = i + 1
            end
            if k <= G.GAME.astral_proj_amount and cards_dont_match(card, astral_proj_view.cards[i]) then
                local temp            = copy_card(card, nil, 0.7)
                temp.states.drag.can  = false
                temp.states.hover.can = false
                astral_proj_view:emplace(temp)
                temp:start_materialize({ G.C.PURPLE })
            end
            i = i + 1
        end
        G.E_MANAGER:add_event(Event({
            func = function()
                astral_proj_view.adjusting_cards = false; return true
            end
        }))
    end
end
