
SMODS.Joker{ --Wolfy
    key = "wolfy",
    config = {
        extra = {
            mult = 333
        }
    },
    loc_txt = {
        ['name'] = 'Wolfy',
        ['text'] = {
            [1] = '{C:red}+333{} Mult alle doppie coppie'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 33,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["fgm_mycustom_jokers"] = true },
    soul_pos = {
        x = 1,
        y = 0
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'uta' 
            or args.source == 'sho' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Two Pair"]) then
                return {
                    mult = card.ability.extra.mult,
                    message = "Chaos"
                }
            end
        end
    end
}