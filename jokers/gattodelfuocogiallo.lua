SMODS.Joker{ --GattoDelFuocoGiallo
    key = "gattodelfuocogiallo",
    config = {
        extra = {
            eternal = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'GattoDelFuocoGiallo',
        ['text'] = {
            [1] = 'meow'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 60,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["fgm_fgm_jokers"] = true },
    soul_pos = {
        x = 9,
        y = 1
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
        if context.individual and context.cardarea == G.play  then
            local created_joker = true
            G.E_MANAGER:add_event(Event({
            func = function()
                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_fgm_gattodelfuocogiallo' })
                if joker_card then
                    joker_card:set_edition("e_negative", true)
                    joker_card:add_sticker('eternal', true)
                end
                
                return true
                end
            }))
            return {
                message = "meow"
            }
        end
    end
}