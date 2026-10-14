Menagerie = {}

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

SMODS.current_mod.badge_colour = SMODS.Gradients['mngy_text_rainbow']
Menagerie.mod = SMODS.current_mod

--#region File Loading
local path = SMODS.current_mod.path .. 'src/'
for _, v in pairs(NFS.getDirectoryItems(path)) do
    assert(SMODS.load_file('src/' .. v))()
end

local enabled_jokers = {
	-- Commons
	'jollibee',
	'apprentice',
	'rorschach',
	'coffee',

	-- Uncommons
	'aerial_ace',

	-- Rares
	'blind_justice',

}

for i = 1, #enabled_jokers do
    assert(SMODS.load_file('content/jokers/' .. enabled_jokers[i] .. '.lua'))()
end

local enabled_decks = {
	'seeded',
	'accretion',
}

for i = 1, #enabled_decks do
    assert(SMODS.load_file('content/decks/' .. enabled_decks[i] .. '.lua'))()
end
--#endregion