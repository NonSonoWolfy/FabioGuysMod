
SMODS.Joker{ --Rak
    key = "rak",
    config = {
        extra = {
            xchips = 100,
            Xmult = 100
        }
    },
    loc_txt = {
        ['name'] = 'Rak',
        ['text'] = {
            [1] = '{C:blue}x100 {}Chips.',
            [2] = '{C:red}x100 {}Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 70,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["fgm_fgm_jokers"] = true },
    soul_pos = {
        x = 0,
        y = 4
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'jud' and args.source ~= 'sou' 
            or args.source == 'buf' or args.source == 'rif' or args.source == 'rta' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.xchips,
                message = "Stfu Wolfy",
                extra = {
                    Xmult = card.ability.extra.Xmult,
                    message = "Stfu Wolfy"
                }
            }
        end
    end
}