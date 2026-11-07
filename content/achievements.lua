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
        if args.type == "mngy_class" then
            return true
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