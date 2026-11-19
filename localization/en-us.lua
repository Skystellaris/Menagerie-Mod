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
					'{C:mngy_mod}Menagerie{} Jokers are {X:attention,C:white}#1#X{}',
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

			b_mngy_hodgepodge = {
				name = 'Hodgepodge Deck',
				text = {
					'All Jokers are {C:attention}guaranteed',
					'to have an {C:attention}editon{} or a {C:attention}sticker.',
					'Start run with a',
					'{C:blue}Common{} Joker with {C:attention}both{}'
				}
			},

			b_mngy_padded = {
				name = 'Padded Deck',
				text = {
					'Starting Deck includes {C:mngy_shields}Shields{},',
					'{C:attention}14{} random cards start',
					'with one random {C:attention}modification{}'
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

			b_mngy_battle = {
				name = 'Battle Deck',
				text = {
					"{C:red}#1#{} discards",
					"every round",
					"Deck contains only",
					"{C:clubs}Clubs{} and {C:mngy_shields}Shields"
				}
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
				}
			},

			b_mngy_splatterpaint = {
				name = 'Splatterpaint Deck',
				text = {
					'Starting Deck includes {C:mngy_shields}Shields.',
					'When a {C:attention}Boss Blind{} is defeated,',
					'a random Suit in your Deck',
					'becomes {C:attention}another{} random suit'
				}
			},

			b_mngy_clown_car = {
				name = 'Clown Car Deck',
				text = {
					'{C:red}#1#{} Joker Slots',
					'{C:attention}+1{} permanent Joker Slot',
					'when a unique {C:attention}Boss Blind{}',
					'is defeated {C:attention}before{}',
					'winning the run'
				}
			},

			b_mngy_perfection = {
				name = 'Perfection Deck',
				text = {
					"{C:blue}#1#{} hands and {C:red}#2#{} discards",
					"every round",
					"Start with only",
					"{C:attention}one{} random suit"
				}
			},

			b_mngy_hopscotch = {
				name = 'Hopscotch Deck',
				text = {
					'{C:red}#1#{} Shop Slots.',
					'Creates {C:attention}+#2#{} extra',
					'Skip Tags when skipping'
				}
			},

			b_mngy_mechanical = {
				name = 'Mechanical Deck',
				text = {
					'{C:attention}+#1#{} Consumable Slots.',
					'{C:attention}Jokers{} cannot appear',
					'in the shop'
				}
			},

			b_mngy_sunken = {
				name = 'Sunken Deck',
				text = {
					'Start run with a {C:dark_edition}Negative {C:attention,T:j_splash}Splash{}.',
					'{C:red}Discarded{} cards are sent to',
					'the bottom of the {C:attention}Deck'
				}
			},

			b_mngy_hollow = {
				name = 'Hollow Earth Deck',
				text = {
					'{C:attention,T:mngy_empty,T_set:Other}Empty Jokers{} are {X:attention,C:white}#1#X{}',
					'more likely to appear',
				}
			},

		},

		Enhanced = {
			m_mngy_doodle = {
				name = 'Doodle Card',
				text = {
					'Never scores.',
					'{C:green}#1# in #2#{} chance to {C:attention}retrigger{}',
					'each adjacent card {C:attention}#3#{} time',
					'{s:0.8,C:inactive}(Cannot retrigger other doodle cards)'
				}
			},

			m_mngy_aurora = {
				name = 'Aurora Card',
				text = {
					'{X:mult,C:white}X1.0{} Mult, gains',
					'{X:mult,C:white}X0.1{} Mult per previously',
					'scored {C:attention}Aurora Card{} this hand',
					'{C:inactive,s:0.8}(Counts itself)'
				}
			},

			m_mngy_confetti = {
				name = 'Confetti Card',
				text = {
					'Gives {X:red,C:white}X#1#{} per card',
					'held in hand when scored.',
					'{C:green}#2# in #3#{} chance to not give {C:mult}Xmult{}',
					'where {C:green}denominator{} is equal to',
					'amount of played cards'
				}
			}
		},

		Tarot = {
			c_mngy_comet = {
				name = "The Comet",
				text = {
					"Converts up to",
					"{C:attention}#1#{} selected cards",
					"to {V:1}#2#{}",
				},
			},

			c_mngy_daydream = {
				name = "The Daydream",
				text = {
					"Enhances {C:attention}#1#{}",
					"selected card to",
					"{C:attention}#2#s",
				},
			},

			c_mngy_celebration = {
				name = "The Celebration",
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},

			c_mngy_night = {
				name = "The Night",
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},
		},

		Joker = {
			-- Common
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
				text = { {
					'Levels up {C:attention}#1#{} by',
					'{C:attention}#2#{} level when #1#',
					'is played for',
					'the next {C:attention}#3#{} round(s)', },
					{ '{C:red}Melts{} into {C:attention}two halves{}',
						'when depleted' }
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
					'gives an {C:attention}adjacent{} Joker',
					'a random {C:dark_edition}Edition{}',
					'at end of round'
				}
			},

			j_mngy_lemnia = {
				name = 'Lemnia',
				text = {
					'When a hand is played,',
					'gives an {C:attention}adjacent{} Joker',
					'a random {C:dark_edition}Edition{}',
					'{C:green}#1# in #2#{} chance this',
					'card is {C:red}destroyed{}',
					'at end of round'
				}
			},

			j_mngy_bottled_water = {
				name = 'Bottled Water',
				text = {
					'{C:money}Sell{} this Joker during',
					'a round to gain',
					'{C:blue}+#1#{} Hands for the round'
				}
			},

			j_mngy_pineapple = {
				name = 'Pineapple',
				text = {
					'Earn {C:money}$#1#{} at end of round if',
					'{C:attention}#2#{} was played',
					'this round.',
					'{C:green}#3# in #4#{} chance to be',
					'{C:red}destroyed{} at end of round'
				}
			},

			j_mngy_envious = {
				name = "Envious Joker",
				text = {
					"Played cards with",
					"{C:mngy_shields}#2#{} suit give",
					"{C:mult}+#1#{} Mult when scored",
				},
			},

			j_mngy_paint_by_numbers = {
				name = 'Paint By Numbers',
				text = {
					'Each scoring {C:attention}Numbered card{}',
					'gives {C:chips}+#1#{} Chips for each',
					'unique scoring {C:attention}Suit'
				}
			},

			j_mngy_punch_card = {
				name = 'Punch Card',
				text = {
					'When {C:attention}Blind{} is selected,',
					'{C:green}#1# in #2#{} chance to create',
					'a {C:attention}#3#.',
					'Chance increases by {C:green}+#4#{}',
					'if chance {C:attention}fails{}, resets',
					'to {C:red}0{} when {C:attention}succeeding{}'
				}
			},

			j_mngy_yield = {
				name = 'Yield Sign',
				text = {
					'{C:blue}Hands{}, {C:red}discards{}, and',
					'{C:attention}hand size{} cannot be {C:attention}reduced',
					'by {C:attention}active{} Jokers or Blinds when held'
				}
			},

			j_mngy_astral_projection = {
				name = 'Astral Projection',
				text = {
					'See top {C:attention}#1#{} cards',
					'in the Deck'
				}
			},

			j_mngy_battersby = {
				name = 'Big Battersby',
				text = {
					"{X:mult,C:white}X#1#{} Mult for",
					"each {C:attention}Joker{} card",
					"excluding itself",
					"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
				}
			},

			-- Uncommon
			j_mngy_magician = {
				name = 'Magician',
				text = {
					'{C:attention}+#1#{} Voucher',
					'in Shop'
				}
			},

			j_mngy_druid = {
				name = 'Druid',
				text = {
					'{C:money}+$#1#{} dollars per {C:blue}Hand',
					'at end of round',
					'{C:red}-#2#{} interest cap'
				}
			},

			j_mngy_overdrive_aces = {
				name = 'Overdrive Aces',
				text = {
					'{C:attention}Aces{}  can fill the gaps',
					'in {C:attention}straights{} and connect',
					'{C:attention}Kings{} to {C:attention}2s{}',
					'{C:inactive,s:0.8}(Ex: 2, A, K, Q, J) '
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

			j_mngy_earthrise = {
				name = 'Earthrise',
				text = {
					'Every {C:blue}Hand{} is considered',
					'the {C:attention}first{} hand of the round.',
					'Every {C:red}Discard{} is considered',
					'the {C:attention}first{} discard of the round'
				}
			},

			j_mngy_wanted_target = {
				name = 'WANTED Joker',
				text = {
					'When {C:attention}Blind{} is set,',
					'selects a {C:green}random{} card',
					'from the {C:attention}Deck{}.',
					'{C:red}Discard{} the selected card',
					'to {C:red}destroy{} it, or {C:blue}play{} the',
					'selected card to give {C:money}$#1#{}',
					'{C:inactive}Target:{} #2# of {V:1}#3#{}'
				}
			},

			j_mngy_wanted = {
				name = 'WANTED Joker',
				text = {
					'When {C:attention}Blind{} is set,',
					'selects a {C:green}random{} card',
					'from the {C:attention}Deck{}.',
					'{C:red}Discard{} the selected card',
					'to {C:red}destroy{} it, or {C:blue}play{} the',
					'selected card to give {C:money}$#1#{}',
					'{C:inactive}Target: None{}'
				}
			},

			j_mngy_swiss_cheese = {
				name = 'Swiss Cheese Joker',
				text = {
					'Each scoring {C:attention}2{}, {C:attention}3{}, and {C:attention}4',
					'is returned to the',
					'{C:attention}top{} of the {C:attention}Deck'
				}
			},

			j_mngy_missing = {
				name = 'Missing Joker?',
				text = {
					'{C:inactive}???'
				}
			},

			j_mngy_hang_10 = {
				name = 'Hang 10!',
				text = {
					'{C:green}#1# in #2#{} chance to',
					'create a {C:tarot}#4#{}',
					'after hand is scored',
					'Chance {C:attention}increases{} by {C:green}#3#{}',
					'for each {C:attention}10{} scored',
					'{C:inactive,s:0.8}(Chance resets at end of round)'
				}
			},

			j_mngy_lucky_clover = {
				name = 'Lucky Clover',
				text = {
					'{C:attention}Lucky Cards{} have an',
					'additional {C:green}#1# in #2#{} chance to',
					'give {X:mult,C:white}X#3#{} Mult',
					'and a {C:green}#4# in #5#{} chance to',
					'give this Joker {C:green}+#6#{} to',
					'all {C:attention}listed{} {C:green,E:1,S:1.1}probabilities',
					'{C:inactive}(Max of {C:green}+#7#{C:inactive},',
					'{C:inactive}Currently: {C:green}+#8#{C:inactive})'
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

			j_mngy_beat_swap_even = {
				name = 'Beat Swap-Metro',
				text = {
					'Retrigger {V:1}Even{}',
					'cards {C:attention}#1#{} time.',
					'{C:attention}Switches{} to {V:2}Odd{} after',
					'a hand is played'
				}
			},

			j_mngy_beat_swap_odd = {
				name = 'Beat Swap-Metro',
				text = {
					'Retrigger {V:1}Odd{}',
					'cards {C:attention}#1#{} time.',
					'{C:attention}Switches{} to {V:2}Even{} after',
					'a hand is played'
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
					'give the {C:attention}next{} discarded',
					'hand {C:attention}Gold Seals{}',
					'{C:inactive}(Currently: {V:1}#2#{C:inactive}/#3#)'
				},
				unlock = {
					'Discard {C:attention}5 {C:money}Gold Cards{}',
					'at once'
				}
			},

			j_mngy_desire_path = {
				name = 'Desire Path',
				text = {
					'The {C:attention}last{} hand of',
					'a round is always treated',
					'as a {C:attention}#1#.',
					'If last hand contains',
					'a {C:attention}#2#{}, then',
					'hand is treated as a',
					'{C:attention}#3#{} instead'
				}
			},

			j_mngy_3d_glasses = {
				name = 'Joker with 3D Glasses',
				text = {
					'{C:attention}Retrigger{} all cards and Jokers',
					'with {C:dark_edition}Foil{} or {C:dark_edition}Holographic{} {C:attention}#1#{} time',
				}
			},

			j_mngy_nuclear_option = {
				name = 'Nuclear Option',
				text = {
					"When {C:attention}Blind{} is selected,",
					"set {C:red}discards{} to {C:attention}1{}.",
					"{C:red}Destroy{} all discarded cards",
				}
			},

			j_mngy_bright_geode = {
				name = 'Bright Geode',
				text = {
					'{C:green}#2# in #3#{} chance for',
					'cards held in hand with',
					'{C:mngy_shields}Shields{} suit to',
					'give {X:chips,C:white}X#1#{} Chips'
				}
			},

			-- Rare
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
			},

			j_mngy_secret = {
				name = 'The Secret',
				text = {
					'{C:dark_edition}???',
				}
			},

			j_mngy_jackolantern = {
				name = 'Jack-O-Lantern',
				text = {
					'Gains {X:mult,C:white}X#1#{} Mult for',
					'each scoring {C:attention}Jack{}',
					'{C:green}#3# in #4#{} chance for each',
					'scoring {C:attention}Jack{} to be {C:red}destroyed{},',
					'{C:inactive}(Currently: {X:mult,C:white}X#2#{C:inactive})',
				}
			},

			j_mngy_ringleader = {
				name = 'Ringleader',
				text = {
					'{X:mult,C:white}X#1#{} Mult for each',
					'{C:attention}unique{} Joker rarity held',
					'{C:inactive,s:0.8}(Does not count this card)',
					'{C:inactive}(Currently: {X:mult,C:white}X#2#{C:inactive} Mult)'
				}
			},

			j_mngy_back_to_the_past = {
				name = 'Back to the Past',
				text = {
					'{C:chips}+#1#{} Chips.',
					'If score {C:attention}Catches Fire{},',
					'{C:red}destroy{} this card and',
					'go back {C:attention}#2#{} Ante'
				}
			},

			j_mngy_emergency_evac = {
				name = 'Emergency Evacuation',
				text = {
					'Rerolling the Shop {C:red}destroys',
					'a {C:green}random{} card in your Deck'
				}
			},

			j_mngy_webcore = {
				name = 'Webcore Joker',
				text = {
					'Gives {X:mult,C:white}X#1#{} Mult for',
					'each {C:attention}unique{} Poker Hand played',
					'in the previous ante',
					'{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)',
				}
			},

			-- Uncategorized
			j_mngy_stargazing = {
				name = 'Stargazing Joker',
				text = {
					'{C:attention}Aurora Cards{} will also',
					'trigger while {C:attention}held in hand'
				}
			},

			j_mngy_ace_up_the_sleeve = {
				name = 'Ace Up The Sleeve',
				text = {
					'Creates a random {C:attention}Tag',
					'when played hand is {C:dark_edition}secret',
					'and contains an {C:attention}Ace'
				}
			},

			j_mngy_russian_roulette = {
				name = 'Russian Roulette',
				text = {
					{
						'Scored cards have a',
						'{C:green}#1# in #2#{} chance to be {C:red}destroyed'
					},
					{
						'This Joker has a {C:green}#1# in #2#{} chance',
						'to {C:red}self-destruct{} and create',
						'a {C:tarot}Death{} when {C:attention}Blind{} is selected'
					}
				}
			},

			j_mngy_polymelia = {
				name = 'Polymelia',
				text = {
					'{C:attention}+#1#{} card selection limit'
				}
			},

			j_mngy_blank_check = {
				name = 'Blank Check',
				text = {
					'Gives {C:money}$#1#{} to {C:money}$#2#',
					'at end of round'
				}
			},

			j_mngy_shield_bearing = {
				name = 'Shield-Bearing Joker',
				text = {
					'Cards with {C:mngy_shields}Shields{} suit',
					'cannot be {C:red}destroyed{} or {C:red}debuffed'
				}
			},

			j_mngy_ante_beats = {
				name = { 'Ante Beats to', 'Play/Win to' },
				text = {
					"{C:mult}+#1#{} Mult per discard",
					"{C:mult}-#2#{} Mult per hand played",
					"{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)",
				}
			},

			j_mngy_balancing_act = {
				name = 'Balancing Act',
				text = {
					'If played hand is a {C:attention}Two Pair,',
					'balance {C:chips}Chips{} and {C:mult}Mult'
				}
			},

			j_mngy_left_mitten = {
				name = 'Left Mitten',
				text = {
					'If the {C:attention}leftmost{} scoring card',
					'is the {C:attention}lowest{} scoring rank,',
					'it and this Joker',
					'permanently gain {C:mult}+#1#{} Mult',
					'{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)',
				}
			},


			j_mngy_cardboard = {
				name = 'Cardboard Joker',
				text = {
					'Gives {X:mult,C:white}X#1#{} Mult at the',
					'end of {C:attention}final hand{} of round if',
					'total score will not beat blind.',
					'{C:red}Self destructs{} on trigger'
				}
			},

			j_mngy_bonus_tickets = {
				name = 'Bonus Tickets',
				text = {
					{
						'{C:attention}Bonus Cards{} have a {C:green}#1# in #2#',
						'chance to be retriggered {C:attention}#3#{} time'
					},
					{
						'{C:attention}Bonus Cards{} have a {C:green}#4# in #5#',
						'chance to give {C:money}$#6#{}'
					}
				}
			},

			j_mngy_poodle = {
				name = 'Poodle',
				text = {
					'{C:chips}+#1#{} Chips.',
					'{C:red}Pops{} if score',
					'{C:attention}catches fire'
				}
			},

			j_mngy_whos_that = {
				name = 'Who\'s That Joker?',
				text = {
					'Sell this card to create',
					'a {C:green}random{} Joker that',
					'has not yet been seen',
					'during this run'
				}
			},

			j_mngy_postcard = {
				name = 'Postcard',
				text = {
					'When {C:money}sold{}, this Joker will appear',
					'in the {C:attention}next Ante\'s Shop{} and gain',
					'{C:chips}+20{} Chips for the rest',
					'of the run',
					'{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)',
				}
			},

			j_mngy_sun_temple = {
				name = 'Sun Temple',
				text = {
					'{C:attention}Stone Cards{} are treated as',
					'{C:hearts}Hearts{}, {C:diamonds}Diamonds{}, and {C:attention}Aces'
				}
			},

			j_mngy_silver_wind = {
				name = 'Silver Wind',
				text = {
					'Playing a {C:clubs}Club {C:attention}Flush{} has a',
					'{C:green}#1# in #2#{} chance to give {C:money}$#3#{} and',
					'a {C:green}#1# in #4#{} chance to create a',
					'{C:dark_edition}Spectral Card',
					"{C:inactive,s:0.8}(Must have room)",
				}
			},

			j_mngy_collectable = {
				name = 'Collectable Joker',
				text = {
					'Gains {C:mult}+#1#{} Mult for each unique',
					'poker hand played this Ante while held.',
					'When {C:attention}#2#{} unique poker hands',
					'are played in an Ante, this card',
					'{C:attention}permanently{} gains {C:mult}+#3#{} Mult,',
					'and a random Joker gains',
					'a random {C:dark_edition}Edition',
					'{C:inactive}(Currently {C:mult}+#4#{C:inactive} Mult)',
				}
			},

			j_mngy_keeping_beat = {
				name = 'Keeping Beat',
				text = {
					'When an {C:attention}Ace{}, {C:attention}2{}, {C:attention}3{}, and {C:attention}4{}',
					'are scored {C:attention}in that order{},',
					'this card cards {X:mult,C:white}X#1#{} Mult.',
					'{X:mult,C:white}Xmult{} resets when one of the',
					'specified ranks are played',
					'out of order',
					'{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)',
				}
			},

			j_mngy_ancestral = {
				name = 'Ancestral Joker',
				text = {
					'{C:attention}Stone Cards{} give {X:chips,C:white}X2{} Chips',
					'instead of {C:chips}+#1#{} Chips'
				}
			},
		},

		Other = {
			mngy_empty = {
				name = 'Empty Slot',
				text = {
					'This card counts as an',
					'Empty Slot for',
					'Joker Stencil-like effects'
				}
			}
		},
	},
	misc = {
		dictionary = {
			k_mngy_ranks_left = 'Ranks left: ',
			k_mngy_banished_ex = 'Banished!',
			k_mngy_plus_joker_slots = '+1 Joker Slot',
			k_mngy_hand_order = 'Hand order: ',
			k_mngy_combo = 'Combo',
			k_mngy_magnetized_ex = 'Magnetized!',
			k_mngy_again_reversed = '!niaga',
			k_mngy_punched_ex = 'Punched!',
			k_mngy_bang_ex = 'Bang!',
			k_mngy_bounty_redeemed_ex = 'Bounty Redeemed!',
			k_mngy_caution_ex = 'Caution!',
			k_mngy_splattered_ex = 'Splattered!',
			k_mngy_kaboom = 'Kaboom',
			k_mngy_going_back_ex = 'Going Back!',
			k_mngy_popped_ex = 'Popped!',
			k_mngy_nostalgic = 'Nostalgic',
			k_mngy_one_ex = "One!",
			k_mngy_two_ex = "Two!",
			k_mngy_three_ex = "Three!",
			k_mngy_four_ex = "Four!",

			-- Config labels
			b_mngy_custom_menu = 'Toggle Custom Menu',
			b_mngy_disable_negative_score = 'Disable Negative Scoring'
		},
		v_text = {},
		suits_singular = {
			mngy_Shields = 'Shield'
		},
		suits_plural = {
			mngy_Shields = 'Shields'
		},
		achievement_names = {
			ach_mngy_nope = 'Nope!',
			ach_mngy_class = 'Top of the Class',
			ach_mngy_jacks = 'Jack O\' Panic',
			ach_mngy_combo = 'C-C-Combo!',
			ach_mngy_fruit = 'Forbidden Fruit',
			ach_mngy_empty = 'No Jokers Here',
			ach_mngy_locked_in = 'Locked In',
			ach_mngy_rainbow = 'Under the Rainbow',
			ach_mngy_perfection = 'Perfection Perfected',
			ach_mngy_sinful = 'The Sinful 5',
			ach_mngy_rocks = 'Colourful Rocks',
			ach_mngy_ten_triggers = '10 Triggers Down',
			ach_mngy_expensive = 'Expensive Tastes',
			ach_mngy_loan_shark = 'Loan Shark',
			ach_mngy_harvest = 'Patient Harvest'
		},
		achievement_descriptions = {
			-- Unlocked
			ach_mngy_nope = 'Use a Wheel of Fortune with a 0 in 4 chance to hit',
			ach_mngy_class = 'Retrigger a single Ace three times',
			ach_mngy_jacks = 'Destroy 4 Jacks at the once',
			ach_mngy_combo = 'Destroy 3 Straight Flushes with Tetrominoker in one run',
			ach_mngy_fruit = 'Have Lemnia or Concord give a Negative Edition',
			ach_mngy_empty = 'Have 5 Jokers with the Empty modifier',
			ach_mngy_locked_in = 'Win a Gold Stake run with 5 Eternal Jokers',
			ach_mngy_rainbow = 'Have 7 different Seals in the Deck at once',
			ach_mngy_perfection = 'Win a run on the Perfection Deck while never having more than 1 Joker',
			ach_mngy_sinful = 'Havy Greedy, Lusty, Wrathful, Gluttonous, and Envious Joker all at once',
			ach_mngy_rocks = 'Havy Arrowhead, Rough Gem, Bloodstone, Onyx Agate, and Bright Geode all at once',
			ach_mngy_ten_triggers = 'Retrigger a single card 10 times in the same hand',
			ach_mngy_expensive = 'Sell an Egg worth $50 or more',
			ach_mngy_loan_shark = 'Win a run while never having more than $10',
			ach_mngy_harvest = 'Create a Legendary Joker from Sowing Seeds',

			-- Hidden
			ach_mngy_nope_hidden = 'Wheel always hits',
			ach_mngy_class_hidden = 'A+++',
			ach_mngy_jacks_hidden = 'Quad Pumpkin Carvin\'',
			ach_mngy_combo_hidden = 'Triple Tetrominoes',
			ach_mngy_fruit_hidden = 'Nothing could be sweeter',
			ach_mngy_empty_hidden = 'Not quite Empty',
			ach_mngy_locked_in_hidden = 'Lock it in',
			ach_mngy_rainbow_hidden = '7 {st:black}Souls{} Seals',
			ach_mngy_perfection_hidden = 'The Perfect Solo Run',
			ach_mngy_sinful_hidden = 'Such common sins...',
			ach_mngy_rocks_hidden = 'Suit-based Excavation',
			ach_mngy_ten_triggers_hidden = 'Retrigger Mania',
			ach_mngy_expensive_hidden = 'Shaken, not Scrambled',
			ach_mngy_loan_shark_hidden = 'On the run with Vagabond',
			ach_mngy_harvest_hidden = 'Planted from Spring to Winter',
		}
	}
}
