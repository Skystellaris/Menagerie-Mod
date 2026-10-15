local has_any_suit_ref = SMODS.has_any_suit
function SMODS.has_any_suit(card)
    local ret = has_any_suit_ref(card)
    if next(SMODS.find_card('j_mngy_rorschach')) and card.base.suit == 'Spades' then
        ret = true
    end
    return ret
end

local emplace_ref = CardArea.emplace
function CardArea:emplace(...)
    emplace_ref(self, ...)
    if G.GAME.selected_back_key and G.GAME.selected_back_key.key == 'b_mngy_seeded' and self == G.jokers then
        G.hand:change_size(-1)
    end
end

local remove_card_ref = CardArea.remove_card
function CardArea:remove_card(...)
    local ret = remove_card_ref(self, ...)
    if G.GAME.selected_back_key and G.GAME.selected_back_key.key == 'b_mngy_seeded' and self == G.jokers then
        G.hand:change_size(1) -- TODO: Figure out why this still draws cards when hand is full/overflowing
    end
    return ret
end

local change_size_ref = CardArea.change_size
function CardArea:change_size(delta)
    change_size_ref(self, delta)
    if G.GAME.selected_back_key and G.GAME.selected_back_key.key == 'b_mngy_seeded' and self == G.jokers then
        G.hand:change_size(delta)
    end
end

local add_to_pool_ref = SMODS.add_to_pool
function SMODS.add_to_pool(prototype_obj, args)
    local ret = add_to_pool_ref(prototype_obj, args)
    args = args or {}

    if G.GAME.selected_back_key and G.GAME.selected_back_key.key == 'b_mngy_accretion' then
        if (prototype_obj.set == 'Booster' and prototype_obj.kind == 'Celestial') or (prototype_obj.set == 'Planet' and args.source == 'sho') then
            ret = false
        end
    end

    return ret
end
