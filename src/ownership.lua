SMODS.Joker:take_ownership('reserved_parking', { mngy_empty = true }, true)

SMODS.Joker:take_ownership('brainstorm', {
        calculate = function(self, card, context)
            if context.modify_final_cashout and card.ability.mngy_inspired then
                card.ability.mngy_inspired = nil
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:set_ability(G.P_CENTERS.j_mngy_inspiration)
                        return true;
                    end
                }))
                return {
                    message = localize('k_mngy_crash')
                }
            end
        end
    },
    true)
