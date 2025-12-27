
SMODS.Joker{ --Tokiko
    key = "tokiko",
    config = {
        extra = {
            chips0 = 1000
        }
    },
    loc_txt = {
        ['name'] = 'Tokiko',
        ['text'] = {
            [1] = '{C:blue}+1000{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 30,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["fgm_pacchetti"] = true },
    soul_pos = {
        x = 6,
        y = 4
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'jud' 
            or args.source == 'sho' or args.source == 'buf' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 1000,
                message = "Warn"
            }
        end
    end
}