Menagerie = {}
Menagerie.mod = SMODS.current_mod

SMODS.Gradient({
	key = "text_rainbow",
	cycle = 10,
	colours = {
		HEX("FFB0B2"),
		HEX("FFD7B0"),
		HEX("FFFAB0"),
		HEX("BFFFB0"),
		HEX("B0FFED"),
		HEX("B0E7FF"),
		HEX("B0B0FF"),
		HEX("E0B0FF"),
	},
})

Menagerie.mod.badge_colour = SMODS.Gradients['mngy_text_rainbow']
G.ARGS.LOC_COLOURS["mngy_mod"] = SMODS.Gradients['mngy_text_rainbow']

--#region File Loading
local path = Menagerie.mod.path .. 'src/'
for _, v in pairs(NFS.getDirectoryItems(path)) do
    assert(SMODS.load_file('src/' .. v))()
end

local enabled_jokers = {
	-- Commons
	'jollibee',
	'apprentice',
	'rorschach',
	'coffee',
	'cherry_on_top',
	'twin_pop',
	'half_pop_l',
	'half_pop_r',
	'sowing_seeds',
	'doppler',
	'concord',
	'lemnia',
	-- 'bottled_water',
	-- 'pineapple',
	-- 'envious',
	-- 'mad_hatter',
	-- 'paint_by_numbers',
	-- 'punch_card',
	-- 'jokitty',

	-- Uncommons
	-- 'magician',
	-- 'druid',
	-- 'overdrive_aces',
	-- 'earthrise',
	-- 'wanted',
	-- 'feature_film',
	-- 'swiss_cheese',
	-- 'missing',
	-- 'duality',
	'hang_10',
	-- 'lucky_clover',
	'magnetism',
	-- 'beat_swap',
	'doppelganger',
	'aerial_ace',
	-- 'trapdoor',
	'coin_pusher',
	'desired_path',
	'3d_glasses',

	-- Rares
	'blind_justice',
	'black_cat',
	'tetrominoker',
	'lovecraftian',
	'moon_rabbit',
	'stained_glass',
	-- 'tic_tac_toe',
	-- 'nuclear_option',
	-- 'soul_food',
	'pro_skater',
	-- 'spinning',
	-- 'secret',
}

for i = 1, #enabled_jokers do
    assert(SMODS.load_file('content/jokers/' .. enabled_jokers[i] .. '.lua'))()
end

local enabled_decks = {
	'stacked',
	'sightseeing',
	'seeded',
	'accretion',
	'echo',
	'loaned',
	'white',
	-- 'hodgepodge',
	-- 'padded',
	--'cloudy',
	-- 'battle',
	'stranded',
	'null',
	'cookie',
	-- 'splatterpaint',
	'clown_car',
	-- 'perfection'
}

for i = 1, #enabled_decks do
    assert(SMODS.load_file('content/decks/' .. enabled_decks[i] .. '.lua'))()
end
--#endregion