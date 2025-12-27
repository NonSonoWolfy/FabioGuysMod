
SMODS.Joker{ --ToninoGG
    key = "toninogg",
    config = {
        extra = {
            dollars0_min = NaN,
            dollars0_max = 1000
        }
    },
    loc_txt = {
        ['name'] = 'ToninoGG',
        ['text'] = {
            [1] = '{C:attention}Guadagna {}un range di soldi',
            [2] = '{C:green}da 1 a 1000${}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 35,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["fgm_leggendari"] = true },
    soul_pos = {
        x = 6,
        y = 5
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
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + pseudorandom('RANGE:0|1000', 0, 1000)
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(pseudorandom('RANGE:0|1000', 0, 1000)), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}