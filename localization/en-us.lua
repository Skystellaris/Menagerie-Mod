--Load Joker Display Definitions if JokerDisplay exists
if JokerDisplay then
	for _, v in pairs(NFS.getDirectoryItems(Menagerie.mod.path .. "localization/joker_display_definitions/")) do
		assert(SMODS.load_file("localization/joker_display_definitions/" .. v, Menagerie.mod.id))()
	end
end

return {
	descriptions = {
		Back = {
			b_mngy_stacked = {
				name = 'Stacked Deck',
				text = {
					'Cards held in hand at',
					'the {C:attention}end of a round{} are',
					'{C:attention}drawn first{} at the',
					'beginning of {C:attention}the next round{}'
				}
			},

			b_mngy_sightseeing = {
				name = "Sightseeing Deck",
				text = {
					'{C:mngy_mod}Menagerie{} Jokers are {X:attention,C:white}3X{}',
					'more likely to appear',
					'{C:attention}+2{} hand size if a',
					'{C:mngy_mod}Menagerie{} Joker held'
				}
			},
			
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

			b_mngy_echo = {
				name = 'Echo Deck',
				text = {
					'{C:red}#2#{} Joker Slot',
					'Start with {C:attention,T:j_invisible}#1#'
				}
			},

			b_mngy_loaned = {
				name = 'Loaned Deck',
				text = {
                    "Go up to {C:red}-$#1#{} in debt",
                    "Set {C:money}money{} to {C:red}$0",
                    "when selecting {C:attention}Boss Blind{}"
				}
			},

			b_mngy_white = {
				name = 'White Deck',
				text = {
					"{C:attention}+1{} card selection limit"
				}
			},

			b_mngy_cloudy = {
				name = 'Cloudy Deck'
			},

			b_mngy_stormy = {
				name = 'Stormy Deck'
			},

			b_mngy_stranded = {
				name = 'Stranded Deck',
				text = {
					'{C:red}Destroyed{} Jokers',
					'can no longer appear'
				}
			},

			b_mngy_null = {
				name = 'Null Deck',
				text = {
					'All {C:attention}listed {C:green,E:1,S:1.1}probabilities',
					'are set to {C:attention}0{}'
				}
			},

			b_mngy_cookie = {
				name = 'Cookie Deck',
				text = {
					'All {C:attention}consumables{} give',
					'{C:money}$#1#{} when used',
					'All sell values are set',
					'to {C:red}-$1{}'
				}
			},

			b_mngy_clown_car = {
				name = 'Clown Car Deck',
				text = {
					'{C:red}#1#{} Joker Slots',
					'{C:attention}+1{} Joker Slot when',
					'a unique {C:attention}Boss Blind{}',
					'is defeated'
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
					'{C:attention}+#1#{} Booster Pack',
					'in Shop'
				}
			},

			j_mngy_rorschach = {
				name = 'Rorschach Joker',
				text = {
					'{C:spades}Spade{} cards are',
					'treated as {C:mngy_suits}any suit{}'
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
				name = 'Left-Pop',
				text = {
					'Levels up {C:attention}#1#{} by',
					'{C:attention}#2#{} level when #1#',
					'is played for',
					'the next {C:attention}#3#{} round(s)',
				}
			},

			j_mngy_half_pop_r = {
				name = 'Right-Pop',
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
					'{X:mult,C:white,s:1.4}X#1#{}',
					'When score {C:attention}catches fire{},',
					'swap to {X:mult,C:white}X#2#{}'
				}
			},

			j_mngy_concord = {
				name = 'Concord',
				text = {
					'{C:chips}#1#{} Chips',
					'{C:green}#2# in #3#{} chance this',
					'card {C:red}goes extinct{} and',
					'gives {C:attention}adjacent{} Jokers',
					'a random {C:dark_edition}Edition{}',
					'at end of round'
				}
			},

			j_mngy_lemnia = {
				name = 'Lemnia',
				text = {
					'When a hand is played,',
					'give an {C:attention}adjacent{} Joker',
					'a random {C:dark_edition}Edition{}',
					'{C:green}#1# in #2#{} chance this',
					'card is {C:red}destroyed{}',
					'at end of round'
				}
			},

			j_mngy_hang_10 = {
				name = 'Hang 10!',
				text = {
					'{C:green}#1# in #2#{} chance to',
					'create a {C:tarot}#4#{}',
					'when hand is played',
					'Chance {C:attention}increases{} by {C:green}#3#{}',
					'for each {C:attention}10{} played',
					'{C:inactive,s:0.8}(Chance resets at end of round)'
				}
			},

			j_mngy_magnetism = {
				name = 'Magnetism',
				text = {
					'When a {C:attention}#1#{}',
					'is drawn, draw one {C:attention}extra',
					'{C:attention}#1#{} from the deck',
					'if one is available'
				}
			},

			j_mngy_doppelganger = {
				name = 'Doppelganger',
				text = {
					'{C:attention}"When Blind is selected"{} effects',
					'also trigger at {C:attention}end of round{}'
				}
			},

            j_mngy_aerial_ace = {
                name = 'Aerial Ace',
                text = {
                    '{C:attention}Aces{} are retriggered, and give',
                    '{C:money}$#1#{} when scored on the',
                    '{C:attention}first hand{} of a round',
                }
            },

			j_mngy_coin_pusher = {
				name = 'Coin Pusher',
				text = {
					'Discarded {C:attention}Gold Cards{}',
					'each give {C:money}$#1#{}',
					'After discarding {C:attention}#3# Gold Cards{},',
					'convert the {C:attention}next{} discarded',
					'hand into {C:attention}Gold Cards{}',
					'{C:inactive}(Currently: {V:1}#2#{C:inactive}/#3#)'
				}
			},

			j_mngy_desire_path = {
				name = 'Desire Path',
				text = {
					'The {C:attention}first{} hand of',
					'a round is always treated',
					'as a {C:attention}#1#.',
					'If first hand contains',
					'a {C:attention}#2#{}, then',
					'hand is treated as a',
					'{C:attention}#3#{} instead'
				}
			},

			j_mngy_3d_glasses = {
				name = 'Joker with 3D Glasses',
				text = {
					'{C:green}#1# in #2#{} chance to',
					'{C:attention}retrigger{} scored {C:dark_edition}Holographic',
					'or {C:blue}Bonus{} cards {C:attention}#3#{} time',
					'Cards with {C:attention}both{} are always',
					'retriggered {C:attention}#4#{} times instead'
				}
			},

            j_mngy_blind_justice = {
                name = 'Blind Justice',
                text = {
                    'Each played and unscoring',
                    '{C:attention}Face{} card gives {X:mult,C:white}X#1#{} Mult'
                }
            },

			j_mngy_black_cat = {
				name = 'Black Cat',
				text = {
					'Gives {C:money}$#1#{} when',
					'a {C:green}probability {C:red}fails'
				},
				unlock = {
					'Fail {C:attention}3{}',
					'probability checks'
				}
			},

            j_mngy_tetrominoker = {
                name = 'Tetrominoker',
                text = {
                    'Draw {C:attention}#1#{} extra cards',
					'at start of round',
                    'If a {C:attention}#2#{} is drawn',
					'into first hand, {C:red}destroy{} all',
					'cards in the {C:attention}#2#'
                }
            },

			j_mngy_lovecraftian = {
				name = 'Lovecraftian Joker',
				text = {
					'When {C:attention}Blind{} is selected,',
					'{E:1,C:red}sacrifice{} a random held {C:attention}Consumable',
					'Will {E:1,C:red}sacrifice{} a random held {C:attention}Joker',
					'if no consumables are held',
					'Effect varies depending',
					'on {E:1,C:red}sacrifice{}'
				}
			},

			j_mngy_moon_rabbit = {
				name = 'Moon Rabbit',
				text = {
					'At end of round, create',
					'a {C:dark_edition}Negative {C:attention}Food Joker',
					'or a {C:dark_edition}Negative {C:tarot}The Moon'
				}
			},

			j_mngy_stained_glass = {
				name = 'Stained Glass Joker',
				text = {
					'{C:mngy_suits}Wild Cards{} are',
					'treated as {C:attention}Glass Cards{}.',
					'When a Glass Card {C:red}breaks{},',
					'make a random card',
					'held in hand {C:mngy_suits}Wild{}'
				}
			},

			j_mngy_pro_skater = {
				name = 'Pro Skater',
				text = {
					'Selects {C:attention}3{} random poker hands',
					'at the start of each round',
					'Gains {X:mult,C:white}X#2#{} after playing',
					'all 3 hands {C:attention}consecutively{}',
					'{C:inactive}(Next hand: #3#)',
					'{C:inactive}(Currently: {X:mult,C:white}X#1#{C:inactive})',
				}
			}

		},
		Other = {}
	},
	misc = {
		dictionary = {
			k_mngy_ranks_left = 'Ranks left: ',
			k_mngy_banished_ex = 'Banished!',
			k_mngy_plus_joker_slots = '+1 Joker Slot',
			k_mngy_hand_order = 'Hand order: ',
			k_mngy_combo = 'Combo',
			k_mngy_magnetized_ex = 'Magnetized!',
			k_mngy_again_reversed = '!niaga'
		},
		v_text = {}
	}
}
