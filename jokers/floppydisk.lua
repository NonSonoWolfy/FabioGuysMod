
SMODS.Joker{ --FloppyDisk
    key = "floppydisk",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'FloppyDisk',
        ['text'] = {
            [1] = 'E\'... Qualcosa... Nessuno sa',
            [2] = 'cosa ci sia dentro, a tuo rischio',
            [3] = 'e pericolo'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["fgm_pacchetti"] = true },
    soul_pos = {
        x = 2,
        y = 5
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'jud' and args.source ~= 'wra' 
            or args.source == 'sho' or args.source == 'buf' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_fgm_floppyfurry' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            local target_joker = card
            
            if target_joker then
                target_joker.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        target_joker:explode({G.C.RED}, nil, 1.6)
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
            end
            return {
                message = "Fursantion"
            }
        end
    end
}