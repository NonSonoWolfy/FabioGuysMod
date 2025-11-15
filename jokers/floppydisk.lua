SMODS.Joker{ --FloppyDisk
    key = "floppydisk",
    config = {
        extra = {
            ignore = 0,
            explode = 0,
            n = 0
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
    pools = { ["fgm_fgm_jokers"] = true },
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
            local created_joker = false
            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                created_joker = true
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_fgm_floppyfurry' })
                    if joker_card then
                        
                        
                    end
                    G.GAME.joker_buffer = 0
                    return true
                    end
                }))
            end
            return {
                message = "Fursantion",
                extra = {
                func = function()
                    card:explode()
                    return true
                    end,
                    colour = G.C.RED
                }
            }
        end
    end
}