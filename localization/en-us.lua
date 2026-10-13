-- Add empty fields to the skeleton here as needed, can maintain the proper structure this way
local loc_table = {
    descriptions = {
        Joker = {},
        Other = {}
    },
    misc = {
        dictionary = {},
        v_text = {}
    }
}

--#region File merging for Jokers
local target_file
for _,v in ipairs(NFS.getDirectoryItems(Menagerie.mod.path .. 'localization/jokers/')) do
	target_file = assert(SMODS.load_file("localization/jokers/" .. v, Menagerie.mod.id))()

    -- Add other targets here as needed, this part could probably be refined somehow, like a recursive enumeration over the loc_tables
	if target_file.descriptions and target_file.descriptions.Joker then
		loc_table.descriptions.Joker = SMODS.merge_defaults(loc_table.descriptions.Joker, target_file.descriptions.Joker)
	end
	if target_file.descriptions and target_file.descriptions.Other then
		loc_table.descriptions.Other = SMODS.merge_defaults(loc_table.descriptions.Other, target_file.descriptions.Other)
	end
	if target_file.misc and target_file.misc.dictionary then
		loc_table.misc.dictionary = SMODS.merge_defaults(loc_table.misc.dictionary, target_file.misc.dictionary)
	end
	if target_file.misc and target_file.misc.v_text then
		loc_table.misc.v_text = SMODS.merge_defaults(loc_table.misc.v_text, target_file.misc.v_text)
	end
end
--#endregion

--Load Joker Display Definitions if JokerDisplay exists
if JokerDisplay then
	for _,v in pairs(NFS.getDirectoryItems(Menagerie.mod.path .. "localization/joker_display_definitions/")) do
		assert(SMODS.load_file("localization/joker_display_definitions/" .. v, Menagerie.mod.id))()
	end
end

return loc_table