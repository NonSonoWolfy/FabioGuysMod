SMODS.Joker{ --Auda
    key = "auda",
    config = {
        extra = {
            eternal = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Auda',
        ['text'] = {
            [1] = 'Spawna {C:green}Dema{} {X:legendary,C:white}Negativo{} ed {X:legendary,C:white}Eterno{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 15,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["fgm_fgm_jokers"] = true },
    soul_pos = {
        x = 6,
        y = 0
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rta' and args.source ~= 'wra' 
          or args.source == 'sho' or args.source == 'rif' or args.source == 'sou' or args.source == 'uta'
          )
          and true
      end,

    
    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            return {
                func = function()
                    
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_fgm_dema' })
                        if joker_card then
                            joker_card:set_edition("e_negative", true)
                            joker_card:add_sticker('eternal', true)
                        end
                        
                        return true
                        end
                    }))
                    
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "VC", colour = G.C.BLUE})
                    end
                    return true
                    end
                }
            end
        end
}