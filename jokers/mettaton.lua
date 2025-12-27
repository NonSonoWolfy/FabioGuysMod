
SMODS.Joker{ --Mettaton
    key = "mettaton",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Mettaton',
        ['text'] = {
            [1] = 'Scambia {C:red}Mult {}e {C:blue}Chips{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["fgm_pacchetti"] = true },
    soul_pos = {
        x = 5,
        y = 2
    },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                swap = true,
                message = "Oh my~"
            }
        end
    end
}