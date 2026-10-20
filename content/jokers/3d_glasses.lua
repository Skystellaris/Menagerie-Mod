SMODS.Joker {
    key = '3d_glasses',
    atlas = 'jokers_uncommon',
    pos = { x = 8, y = 1 },
    rarity = 3,
    config = {
        extra = {
            repetitions = 1,
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_holo
        info_queue[#info_queue+1] = G.P_CENTERS.e_foil
        return { vars = { card.ability.extra.repetitions } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card.edition and (context.other_card.edition.holo or context.other_card.edition.foil) then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end

        if context.retrigger_joker_check and context.other_card.edition and (context.other_card.edition.holo or context.other_card.edition.foil) then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end
    end,
}