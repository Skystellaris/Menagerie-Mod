SMODS.Gradient {
	key = "suits",
	colours = {
		G.C.SUITS.Spades,
		G.C.SUITS.Hearts,
		G.C.SUITS.Clubs,
		G.C.SUITS.Diamonds
	},
	cycle = 8,
}

G.ARGS.LOC_COLOURS["mngy_suits"] = SMODS.Gradients['mngy_suits']

--#region Sprites

SMODS.Atlas {
	key = 'decks',
	path = 'decks.png',
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = 'jokers_common',
	path = 'jokers_common.png',
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = 'punch_card',
	path = 'punch_card.png',
	px = 93,
	py = 69
}

SMODS.Atlas {
	key = 'jokers_uncommon',
	path = 'jokers_uncommon.png',
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = 'beat_swap',
	path = 'jokers_uncommon.png',
	px = 71,
	py = 95,
	atlas_table = 'STATE_ATLAS'
}

SMODS.Atlas {
	key = 'trapdoor',
	path = 'trapdoor.png',
	px = 68,
	py = 97
}

SMODS.Atlas {
	key = 'jokers_rare',
	path = 'jokers_rare.png',
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = 'pro_skater',
	path = 'pro_skater.png',
	px = 73,
	py = 73
}

SMODS.Atlas {
	key = 'placeholders',
	path = 'placeholders.png',
	px = 71,
	py = 95
}

--#endregion

--#region Sounds
for i = 1, 3 do
	SMODS.Sound {
		key = 'combo'..i,
		path = 'combo'..i..'.ogg'
	}
end

SMODS.Sound {
	key = 'combo_finish',
	path = 'combo_finish.ogg'
}

SMODS.Sound {
	key = 'combo_fail',
	path = 'combo_fail.ogg'
}

--#endregion