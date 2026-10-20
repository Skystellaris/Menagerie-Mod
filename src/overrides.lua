local has_any_suit_ref = SMODS.has_any_suit
function SMODS.has_any_suit(card)
    local ret = has_any_suit_ref(card)

    if next(SMODS.find_card('j_mngy_rorschach')) and card.base.suit == 'Spades' then
        ret = true
    end

    if G.GAME.mngy_cloudy and card.facing == 'back' then
        ret = true
    end

    return ret
end

local emplace_ref = CardArea.emplace
function CardArea:emplace(card, location, stay_flipped)
    emplace_ref(self, card, location, stay_flipped)

    if G.GAME.mngy_seeded and self == G.jokers then
        G.hand:change_size(-1)
    end

    if G.GAME.mngy_sightseeing and self == G.jokers and card.config.center_key:find('j_mngy_') then
        G.GAME.mngy_jokers = (G.GAME.mngy_jokers or 0) + 1
        if G.GAME.mngy_jokers == 1 then
            G.hand:change_size(2)
        end
    end
end

local remove_card_ref = CardArea.remove_card
function CardArea:remove_card(card, discarded_only)
    local ret = remove_card_ref(self, card, discarded_only)

    if G.GAME.mngy_seeded and self == G.jokers then
        G.hand:change_size(1) -- TODO: Figure out why this still draws cards when hand is full/overflowing
    end
        
    if G.GAME.mngy_sightseeing and self == G.jokers and card.config.center_key:find('j_mngy_') then
        G.GAME.mngy_jokers = (G.GAME.mngy_jokers or 0) - 1
        if G.GAME.mngy_jokers == 0 then
            G.hand:change_size(-2)
        end
    end

    return ret
end

local change_size_ref = CardArea.change_size
function CardArea:change_size(delta)
    change_size_ref(self, delta)
    if G.GAME.mngy_seeded and self == G.jokers then
        G.hand:change_size(delta)
    end
end

local add_to_pool_ref = SMODS.add_to_pool
function SMODS.add_to_pool(prototype_obj, args)
    local ret = add_to_pool_ref(prototype_obj, args)
    args = args or {}

    if G.GAME.mngy_accretion then
        if (prototype_obj.set == 'Booster' and prototype_obj.kind == 'Celestial') or (prototype_obj.set == 'Planet' and args.source == 'sho') then
            ret = false
        end
    end

    return ret
end

local smods_wrap_ref = SMODS.wrap_around_straight
function SMODS.wrap_around_straight()
    local ret = smods_wrap_ref()
    if next(SMODS.find_card('j_mngy_overdrive_aces')) then
        ret = true
    end
    return ret
end

local chip_xmult_ref = Card.get_chip_x_mult
function Card:get_chip_x_mult(context)
    local ret = chip_xmult_ref(self, context)
    if next(SMODS.find_card('j_mngy_lucky_clover')) and self.ability.effect == "Lucky Card" then
        for _, v in pairs(SMODS.find_card('j_mngy_lucky_clover')) do
            if SMODS.pseudorandom_probability(self, 'mngy_clover_xmult', v.ability.extra.xmult_prob, v.ability.extra.xmult_odds) then
                self.lucky_trigger = true
                ret = ret + 1.4
            end
        end
    end
    return ret
end

local oldfunc = Game.main_menu
function Game:main_menu(change_context)
    local ret = oldfunc(self, change_context)

    if Menagerie.mod.config.menu then

        -- make the title screen use different background colors
        G.SPLASH_BACK:define_draw_steps({ {
            shader = 'splash',
            send = {
                { name = 'time',       ref_table = G.TIMERS,  ref_value = 'REAL_SHADER' },
                { name = 'vort_speed', val = 0.4 },
                { name = 'colour_1',   ref_table = Menagerie.C, ref_value = 'MNGY_PRIMARY' },
                { name = 'colour_2',   ref_table = Menagerie.C, ref_value = 'MNGY_SECONDARY' },
            }
        } })
    end

    return ret
end
