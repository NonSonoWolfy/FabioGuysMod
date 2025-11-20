
SMODS.Joker{ --Lynx
    key = "lynx",
    config = {
        extra = {
            xchips = 2,
            Xmult = 2
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
    pools = { ["fgm_fgm_jokers"] = true },
    soul_pos = {
        x = 0,
        y = 6
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' 
            or args.source == 'sho' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.xchips,
                message = "CHAOS ",
                extra = {
                    Xmult = card.ability.extra.Xmult,
                    message = "CHAOS"
                }
            }
        end
    end
}