JokerDisplay.Definitions["j_mngy_aerial_ace"] = 
{ -- Business Card
    extra = {
        {{ text = "(A)" }},
    },
    extra_config = {
        colour = G.C.UI.TEXT_INACTIVE,
        scale = 0.3
    },
    text = {
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
        { text = "x", scale = 0.35 },
        { ref_table = "card.joker_display_values", ref_value = "dollars", signed = "$" },
    },
    calc_function = function(card)
        local count = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' and G.GAME.current_round.hands_played == 0 then
            for _, scoring_card in pairs(scoring_hand) do
                if scoring_card:get_id() == 14 then
                    count = count + 1
                end
            end
        end
        card.joker_display_values.count = count
        card.joker_display_values.dollars = card.ability.extra.dollars
    end,
    style_function = function (card, text, reminder_text, extra)
        if text and text.children[3] then
            text.children[3].config.colour = card.ability.extra.dollars < 0 and G.C.RED or G.C.GOLD
        end
    end
}