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

path = SMODS.current_mod.path .. 'content/jokers/'
for _, v in pairs(NFS.getDirectoryItems(path)) do
    assert(SMODS.load_file('content/jokers/' .. v))()
end

path = SMODS.current_mod.path .. 'content/decks/'
for _, v in pairs(NFS.getDirectoryItems(path)) do
    assert(SMODS.load_file('content/decks/' .. v))()
end
--#endregion