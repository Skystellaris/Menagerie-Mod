-- Derived from Ortalab's Pinkprint
Menagerie.fake_copy = Card:extend()

for key, func in pairs(Card) do
    if type(func) == 'function' then
        Menagerie.fake_copy[key] = function(self, ...)
            return Card[key](self.mngy_fake_copy, ...)
        end
    end
end

function Menagerie.fake_copy:init(args)
    self.base_cost = args.base_cost or 0
    self.extra_cost = args.extra_cost or 0
    self.cost = args.cost or 0
    self.sell_cost = args.sell_cost or 0
    self.sell_cost_label = args.sell_cost_label or 0
    self.area = args.mngy_fake_copy.area
    self.base = {}

    self.key = args.key
    self.fake_card = true
    self.mngy_fake_copy = args.mngy_fake_copy
    self.ability = args.ability or {}
    self.config = args.config
    
    local new_ability = {
        name = G.P_CENTERS[self.key].name,
        effect = G.P_CENTERS[self.key].effect,
        set = G.P_CENTERS[self.key].set,
        mult = G.P_CENTERS[self.key].config.mult or 0,
        h_mult = G.P_CENTERS[self.key].config.h_mult or 0,
        h_x_mult = G.P_CENTERS[self.key].config.h_x_mult or 0,
        h_dollars = G.P_CENTERS[self.key].config.h_dollars or 0,
        p_dollars = G.P_CENTERS[self.key].config.p_dollars or 0,
        t_mult = G.P_CENTERS[self.key].config.t_mult or 0,
        t_chips = G.P_CENTERS[self.key].config.t_chips or 0,
        x_mult = G.P_CENTERS[self.key].config.Xmult or 1,
        e_mult = G.P_CENTERS[self.key].config.Emult or 0,
        ee_mult = G.P_CENTERS[self.key].config.EEmult or 0,
        eee_mult = G.P_CENTERS[self.key].config.EEEmult or 0,
        hyper_mult = type(G.P_CENTERS[self.key].config.Hmult) == 'table' and G.P_CENTERS[self.key].config.Hmult or {0, 0},
        x_chips = G.P_CENTERS[self.key].config.Xchips or 0,
        e_chips = G.P_CENTERS[self.key].config.Echips or 0,
        ee_chips = G.P_CENTERS[self.key].config.EEchips or 0,
        eee_chips = G.P_CENTERS[self.key].config.EEEchips or 0,
        hyper_chips = type(G.P_CENTERS[self.key].config.Hchips) == 'table' and G.P_CENTERS[self.key].config.Hchips or {0, 0},
        h_size = G.P_CENTERS[self.key].config.h_size or 0,
        d_size = G.P_CENTERS[self.key].config.d_size or 0,
        extra = copy_table(G.P_CENTERS[self.key].config.extra) or nil,
        extra_value = 0,
        type = G.P_CENTERS[self.key].config.type or '',
        order = G.P_CENTERS[self.key].order or nil,
        forced_selection = self.ability and self.ability.forced_selection or nil,
        perma_bonus = self.ability and self.ability.perma_bonus or 0,
    }
    new_ability = SMODS.merge_defaults(new_ability, SMODS.get_default_ability_vars(G.P_CENTERS[self.key], self, true))
    
    self.ability = self.ability or {}
    new_ability.extra_value = nil
    new_ability.debuff_sources = self.ability.debuff_sources or {}
    self.ability.extra_value = self.ability.extra_value or 0
    for k, v in pairs(new_ability) do
        self.ability[k] = v
    end
    
    -- handles card_limit/extra_slots_used changes
    self.ability.card_limit = self.ability.card_limit + (G.P_CENTERS[self.key].config.card_limit or 0)
    self.ability.extra_slots_used = self.ability.extra_slots_used + (G.P_CENTERS[self.key].config.extra_slots_used or 0)
    
    
    -- reset keys do not persist on ability change
    for _, k in ipairs(SMODS.get_ability_reset_keys(self) or {}) do
        self.ability[k] = new_ability[k]
    end
end

function Menagerie.fake_copy:save()
    local cardTable = {
        base_cost = self.base_cost,
        extra_cost = self.extra_cost,
        cost = self.cost,
        sell_cost = self.sell_cost,
        ability = self.ability,
        fake_card = true,
        config = {
            center = self.config.center.key
        },
    }
    return cardTable
end

local mngy_card_save = Card.save
function Card:save()
    local cardTable = mngy_card_save(self)
    if self.ability.mngy_fake_copy and type(self.ability.mngy_fake_copy) ~= 'string' then
        cardTable.mngy_fake_copy = Menagerie.fake_copy.save(self.ability.mngy_fake_copy)
    end
    return cardTable
end

local mngy_card_eval_status_text = card_eval_status_text
function card_eval_status_text(card, eval_type, amt, percent, dir, extra)
    if card.mngy_fake_copy then card = card.mngy_fake_copy end
    mngy_card_eval_status_text(card, eval_type, amt, percent, dir, extra)
end