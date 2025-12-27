
SMODS.Joker{ --Fabione Nazionale
    key = "fabionenazionale",
    config = {
        extra = {
            dollars0 = 3000
        }
    },
    loc_txt = {
        ['name'] = 'Fabione Nazionale',
        ['text'] = {
            [1] = 'Mette i soldi a{C:attention} 3000{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1000,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["fgm_leggendari"] = true },
    soul_pos = {
        x = 2,
        y = 6
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'rif' 
            or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = 3000
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Non riuscivo a dargli la abilità di mettere ante 39", colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}