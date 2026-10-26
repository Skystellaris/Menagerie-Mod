--#region Colors and Gradients
Menagerie.C = {
	MNGY_INSIDE  = HEX('F9E79F'), -- inner swirl
	MNGY_MIDDLE  = HEX('FFABAB'), -- band blended between the other two
	MNGY_OUTSIDE = HEX('FF6F91')  -- outer swirl
}

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

--#endregion

--#region Shaders
SMODS.Shader({
	key = 'confetti_menu_bg',
	path = 'confetti_menu_bg.fs',
	original_key = 'confetti_menu_bg'
})

-- Vanilla 'splash' shader with three positional bands (inside/middle/outside)
SMODS.Shader({
	key = 'menu_bg',
	path = 'menu_bg.fs'
})
--#endregion

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
	px = 69,
	py = 93
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
