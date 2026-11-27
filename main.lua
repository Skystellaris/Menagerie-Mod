Menagerie = {}
Menagerie.mod = SMODS.current_mod

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
	'doppler',
	'concord',
	'lemnia',
	'bottled_water',
	'pineapple',
	'envious',
	-- 'mad_hatter',
	'paint_by_numbers',
	'punch_card',
	-- 'jokitty',
	'yield',
	'astral_projection',
	-- 'dart_monkey',
	'battersby',
	'blank_check',
	'earthworm',
	'collectable',
	'cardboard',
	'left_mitten',
	'clownfish',
	'jeanie',
	'poodle',
	'postcard',
	-- 'cuckoo_egg',
	-- 'robins_nest',
	'ante_beats',

	-- Uncommons
	'magician',
	'druid',
	'overdrive_aces',
	'sowing_seeds',
	'earthrise',
	'wanted',
	'swiss_cheese',
	'missing',
	'hang_10',
	'magnetism',
	'beat_swap',
	'doppelganger',
	'aerial_ace',
	-- 'trapdoor',
	'coin_pusher',
	'desire_path',
	-- 'crypto',
	'stargazing',
	-- 'balloon_boy',
	'acceleration',
	-- 'ofuda',
	'ace_up_the_sleeve',
	'chameleon',
	'russian_roulette',
	-- 'curiosity',
	'polymelia',
	-- 'paleontologist',
	-- 'shield_bearing',
	'bright_geode',
	-- 'stardust',
	'ancestral',
	'skipping_stone',
	'balancing_act',
	-- 'post_it',
	'bonus_tickets',
	-- 'truck_driver',
	-- 'package_delivery',
	-- 'fashionista',
	'sun_temple',
	'silver_wind',
	'intl_saboteur',
	'detective',
	-- 'flashlight',
	'treasure_map',
	'inspiration',

	-- Rares
	'blind_justice',
	'black_cat',
	'tetrominoker',
	'lovecraftian',
	'moon_rabbit',
	'stained_glass',
	'3d_glasses',
	-- 'tic_tac_toe',
	'nuclear_option',
	-- 'soul_food',
	'lucky_clover',
	'pro_skater',
	-- 'spinning',
	'secret',
	'jackolantern',
	'webcore',
	'ringleader',
	'back_to_the_past',
	-- 'pot_of_gold',
	'emergency_evac',
	-- 'shining_star',
	'egg_registry',
	-- 'calculator',
	'keeping_beat',
	-- 'malware',
	-- 'shooting_gallery',

	-- Scrapped
	-- 'whos_that',
}

for i = 1, #enabled_jokers do
    assert(SMODS.load_file('content/jokers/' .. enabled_jokers[i] .. '.lua'))()
end

local enabled_decks = {
	'stacked',
	'loaned',
	'white',
	'hodgepodge',
	'padded',
	'sightseeing',
	'seeded',
	'accretion',
	'echo',
	--'cloudy',
	'battle',
	'stranded',
	'null',
	'cookie',
	'splatterpaint',
	'clown_car',
	'perfection',
	-- 'hopscotch',
	'mechanical',
	'sunken',
	'hollow',

	-- Scrapped
	-- 'hopscotch',
}

for i = 1, #enabled_decks do
    assert(SMODS.load_file('content/decks/' .. enabled_decks[i] .. '.lua'))()
end

local enabled_suits = {
	'shields'
}

for i = 1, #enabled_suits do
    assert(SMODS.load_file('content/suits/' .. enabled_suits[i] .. '.lua'))()
end

local enabled_enhancements = {
	'doodle',
	'aurora',
	'confetti',
}

for i = 1, #enabled_enhancements do
    assert(SMODS.load_file('content/enhancements/' .. enabled_enhancements[i] .. '.lua'))()
end

local enabled_consumables = {
	'comet',
	'daydream',
	'celebration',
	'night'
}

for i = 1, #enabled_consumables do
    assert(SMODS.load_file('content/consumables/' .. enabled_consumables[i] .. '.lua'))()
end

assert(SMODS.load_file('content/achievements.lua'))()
--#endregion