--Load Joker Display Definitions if JokerDisplay exists
if JokerDisplay then
	for _, v in pairs(NFS.getDirectoryItems(Menagerie.mod.path .. "localization/joker_display_definitions/")) do
		assert(SMODS.load_file("localization/joker_display_definitions/" .. v, Menagerie.mod.id))()
	end
end

return {
	descriptions = {
		Back = {
			b_mngy_seeded = {
				name = 'Seeded Deck',
				text = {
					'{C:attention}+1{} hand size for',
					'each empty {C:attention}Joker slot{}'
				}
			},

			b_mngy_accretion = {
				name = 'Accretion Deck',
				text = {
					'Level up {C:attention}every{} Poker Hand',
					'when a {C:attention}Boss Blind{} is defeated',
					'{C:planet}Planet{} cards and {C:attention}Celestial Packs{}',
					'cannot appear in the Shop'
				}
			},

		},

		Joker = {
			j_mngy_jollibee = {
				name = 'Jollibee',
				text = {
					'{C:chips}+#1#{} Chips'
				}
			},

			j_mngy_apprentice = {
				name = 'Apprentice',
				text = {
					'{C:attention}+#1#{} Booster',
					'in Shop'
				}
			},

			j_mngy_rorschach = {
				name = 'Rorschach Joker',
				text = {
					'{C:spades}Spade{} cards are',
					'treated as {C:mngy_suits}Wild{}'
				}
			},

            j_mngy_blind_justice = {
                name = 'Blind Justice',
                text = {
                    'Each played and unscoring',
                    '{C:attention}Face{} card gives {X:mult,C:white}X#1#{} Mult'
                }
            },

            j_mngy_aerial_ace = {
                name = 'Aerial Ace',
                text = {
                    '{C:attention}Aces{} are retriggered, and give',
                    '{C:money}$#1#{} when scored on the',
                    '{C:attention}first hand{} of a round',
                }
            }
		},
		Other = {}
	},
	misc = {
		dictionary = {},
		v_text = {}
	}
}
