
SMODS.Joker{ --Lynx
    key = "lynx",
    config = {
        extra = {
            xchips0 = 2,
            xmult0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Lynx',
        ['text'] = {
            [1] = '{C:blue}x2 {}Chips. {C:red}x2 {}Mult.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["fgm_pacchetti"] = true },
    soul_pos = {
        x = 0,
        y = 6
    },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = 2,
                message = "CHAOS ",
                extra = {
                    Xmult = 2,
                    message = "CHAOS"
                }
            }
        end
    end
}