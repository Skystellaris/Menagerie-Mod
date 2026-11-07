SMODS.Back {
    key = 'padded',
    atlas = 'decks',
    pos = { x = 4, y = 0 },
    include_shields = true,

    apply = function(self, back)
        local janky_weighted_modifications = {
            'enh',
            'enh',
            'enh',
            'enh',
            'enh',
            'edi',
            'edi',
            'edi',
            'seal',
            'seal',
        }
        G.E_MANAGER:add_event(Event({
            func = function()
                local chosen_cards = {}
                for i = 1, 14 do

                    local _c = pseudorandom_element(G.playing_cards, 'padded'..i)
                    local k = 1

                    while _c.mngy_padded_chosen do
                        _c = pseudorandom_element(G.playing_cards, 'padded'..i..k)
                    end

                    _c.mngy_padded_chosen = true
                    table.insert(chosen_cards, _c)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            _c.mngy_padded_chosen = nil
                            return true;
                        end
                    }))
                end

                for i, v in ipairs(chosen_cards) do
                    local chosen_mod = pseudorandom_element(janky_weighted_modifications, 'mod_choice'..i)

                    if chosen_mod == 'enh' then
                        local enh = SMODS.poll_enhancement({key = 'padded_enh_'..i, guaranteed = true})
                        v:set_ability(enh)
                    elseif chosen_mod == 'edi' then
                        local edi = SMODS.poll_edition({key = 'padded_edi_'..i, guaranteed = true, no_negative = true})
                        v:set_edition(edi, true, true)
                    elseif chosen_mod == 'seal' then
                        local seal = SMODS.poll_seal({key = 'padded_seal_'..i, guaranteed = true})
                        v:set_seal(seal, true, true)
                    end
                end
                return true;
            end
        }))
    end
}