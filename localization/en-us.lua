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

			j_mngy_coffee = {
				name = 'Coffee',
				text = {
					'{C:attention}Retriggers{} the Joker',
					'to the left {C:attention}1{} time',
					'for the next {C:attention}#1#{} hand(s)'
				}
			},

			j_mngy_cherry_on_top = {
				name = 'Cherry On Top',
				text = {
					'When a {C:attention}Boss Blind{}',
					'is defeated, {C:attention}level up{} the',
					'last played hand by {C:attention}#1#{} levels',
					'and {C:red}consume{} this Joker'
				}
			},

			j_mngy_twin_pop = {
				name = 'Twin Pop',
				text = {{
					'Levels up {C:attention}#1#{} by',
					'{C:attention}#2#{} level when #1#',
					'is played for',
					'the next {C:attention}#3#{} round(s)',},
					{'{C:red}Melts{} into {C:attention}two halves{}',
					'when depleted'}
				}
			},

			j_mngy_half_pop_l = {
				name = 'Left Half Pop',
				text = {
					'Levels up {C:attention}#1#{} by',
					'{C:attention}#2#{} level when #1#',
					'is played for',
					'the next {C:attention}#3#{} round(s)',
				}
			},

			j_mngy_half_pop_r = {
				name = 'Right Half Pop',
				text = {
					'Levels up {C:attention}#1#{} by',
					'{C:attention}#2#{} level when #1#',
					'is played for',
					'the next {C:attention}#3#{} round(s)',
				}
			},

			j_mngy_sowing_seeds = {
				name = 'Sowing Seeds',
				text = {
					'When {C:money}sold{}, create a',
					'random {V:1}#1#{} Joker',
					'Rarity {C:attention}increases{} after',
					'every rank is {C:red}discarded{} once'
				}
			},

			j_mngy_doppler = {
				name = 'Doppler Effect',
				text = {
					'{X:mult,C:white}X#1#{}, when score {C:attention}catches fire{},',
					'scoring changes to {X:mult,C:white}X#2#{}'
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
		dictionary = {
			k_mngy_ranks_left = 'Ranks left: '
		},
		v_text = {}
	}
}
