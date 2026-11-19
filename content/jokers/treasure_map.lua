SMODS.Joker {
    key = 'treasure_map',
    atlas = 'placeholders',
    pos = { x = 3, y = 1 },
    rarity = 2,
    config = {
        extra = {
            chosen_tag = 'tag_uncommon',
            money = 15,
            percent = 10,
            bosses_beat = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        if card.area and card.area.config.collection then
            card.ability.extra.chosen_tag = SMODS.poll_object({ type = 'Tag' })
        end
        info_queue[#info_queue + 1] = G.P_TAGS[card.ability.extra.chosen_tag]
        info_queue[#info_queue + 1] = G.P_CENTERS.j_golden
        info_queue[#info_queue + 1] = G.P_TAGS.tag_negative
        return { vars = { localize { set = 'Tag', type = 'name_text', key = card.ability.extra.chosen_tag }, card.ability.extra.money, card.ability.extra.percent, card.ability.extra.bosses_beat * card.ability.extra.percent } }
    end,

    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.chosen_tag = SMODS.poll_object({ type = 'Tag' })
    end,

    calculate = function(self, card, context)
        if context.tag_added and context.tag_added.key == card.ability.extra.chosen_tag then
            SMODS.calculate_effect({ message = localize('k_mngy_treasure'), colour = G.C.GOLD }, card)
            G.E_MANAGER:add_event(Event({
                delay = 0.45,
                trigger = 'after',
                func = function()
                    card:juice_up(0.8, 0.8)
                    play_sound('tarot1', math.random() * 0.2 + 0.9, 0.5)
                    ease_dollars(card.ability.extra.money, true)
                    return true;
                end
            }))
            G.E_MANAGER:add_event(Event({
                delay = 0.3,
                trigger = 'after',
                func = function()
                    card:juice_up(0.8, 0.8)
                    play_sound('tarot1', math.random() * 0.2 + 0.9, 0.5)
                    local _c = SMODS.add_card({ key = 'j_golden' })
                    _c:start_materialize()
                    return true;
                end
            }))
            G.E_MANAGER:add_event(Event({
                delay = 0.3,
                trigger = 'after',
                func = function()
                    card:juice_up(0.8, 0.8)
                    play_sound('tarot1', math.random() * 0.2 + 0.9, 0.5)
                    play_sound('generic1', math.random() * 0.2 + 0.9, 0.5)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    add_tag(Tag('tag_negative'))
                    return true;
                end
            }))
            G.E_MANAGER:add_event(Event({
                delay = 1,
                trigger = 'after',
                func = function()
                    SMODS.destroy_cards(card, { immediate = true })
                    return true;
                end
            }))
        end

        if context.end_of_round and context.main_eval and context.beat_boss and not context.blueprint then
            card.ability.extra.bosses_beat = card.ability.extra.bosses_beat + 1
            return {
                message = localize('k_mngy_yarr_ex')
            }
        end

        if context.modify_weights and context.pool_types['Tag'] and not context.blueprint then
            context.pool[card.ability.extra.chosen_tag].weight = context.pool[card.ability.extra.chosen_tag].weight +
            (context.pool[card.ability.extra.chosen_tag].weight * (card.ability.extra.bosses_beat * (card.ability.extra.percent / 100)))
        end
    end,
}
