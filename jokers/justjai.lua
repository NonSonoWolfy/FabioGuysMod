
SMODS.Joker{ --Just_Jai
    key = "justjai",
    config = {
        extra = {
            dollars0 = 100
        }
    },
    loc_txt = {
        ['name'] = 'Just_Jai',
        ['text'] = {
            [1] = '{C:money}+100{} Dollari alla fine di ogni round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["fgm_pacchetti"] = true },
    soul_pos = {
        x = 3,
        y = 2
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
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 100
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Donazione", colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}