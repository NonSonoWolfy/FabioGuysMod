
SMODS.Joker{ --Wolfy
    key = "nonsonowolfy",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Wolfy',
        ['text'] = {
            [1] = '{C:uncommon}Quando un pagliaccio si trasferisce{}',
            [2] = '{C:uncommon}in un palazzo, non diventa un re, il{}',
            [3] = '{C:uncommon}palazzo diventa un circo{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["fgm_fgm_jokers"] = true },
    soul_pos = {
        x = 6,
        y = 6
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' and args.source ~= 'sou' 
            or args.source == 'rta' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end
}