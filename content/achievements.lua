SMODS.Achievement {
    key = 'nope',
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "mngy_nope" then
            return true
        end
    end
}

SMODS.Achievement {
    key = 'class',
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "mngy_retriggers" then
            return args.card:get_id() == 14 and args.retriggers >= 3
        end
    end
}

SMODS.Achievement {
    key = 'jacks',
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "mngy_jacks" then
            return true
        end
    end
}

SMODS.Achievement {
    key = 'combo',
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "mngy_combo" then
            return true
        end
    end
}

SMODS.Achievement {
    key = 'fruit',
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "mngy_fruit" then
            return true
        end
    end
}

SMODS.Achievement {
    key = 'empty',
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "modify_jokers" then
            local empties = 0
            for _, v in pairs(G.jokers.cards) do
                if v.config.center.mngy_empty then
                    empties = empties + 1
                end
            end
            return empties >= 5
        end
    end
}

SMODS.Achievement {
    key = 'locked_in',
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "win" and G.GAME.stake == 8 then
            local eternals = 0
            for _, v in pairs(G.jokers.cards) do
                if v.eternal then
                    eternals = eternals + 1
                end
            end
            return eternals >= 5
        end
    end
}

--[[ SMODS.Achievement {
    key = 'rainbow',
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "modify_deck" then
            return true
        end
    end
} ]]

SMODS.Achievement {
    key = 'perfection',
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "win" and G.GAME.selected_back_key.key == 'b_mngy_perfection' then
            return not G.GAME.mngy_perfection_failed
        end

        if args.type == 'modify_jokers' and #G.jokers.cards > 1 and G.GAME.selected_back_key.key == 'b_mngy_perfection' then
            G.GAME.mngy_perfection_failed = true
        end
    end
}

SMODS.Achievement {
    key = 'sinful',
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "modify_jokers" then
            return next(SMODS.find_card('j_greedy_joker')) and next(SMODS.find_card('j_lusty_joker')) and
            next(SMODS.find_card('j_wrathful_joker')) and next(SMODS.find_card('j_gluttenous_joker')) and
            next(SMODS.find_card('j_mngy_envious'))
        end
    end
}

--[[ SMODS.Achievement {
    key = 'rocks',
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "modify_jokers" then
            return next(SMODS.find_card('j_rough_gem')) and next(SMODS.find_card('j_bloodstone')) and next(SMODS.find_card('j_arrowhead')) and next(SMODS.find_card('j_onyx_agate')) and next(SMODS.find_card('j_mngy_bright_geode'))
        end
    end
} ]]

SMODS.Achievement {
    key = 'ten_triggers',
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "mngy_retriggers" then
            return args.retriggers >= 10
        end
    end
}

SMODS.Achievement {
    key = 'expensive',
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "mngy_expensive" then
            return true
        end
    end
}

SMODS.Achievement {
    key = 'loan_shark',
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true,
    unlock_condition = function(self, args)
        if args.type == "win" then
            return not G.GAME.mngy_failed_loan_shark
        end
    end
}
