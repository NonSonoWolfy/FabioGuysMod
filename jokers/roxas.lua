SMODS.Joker{ --Roxas
    key = "roxas",
    config = {
        extra = {
            totalplayingcards = 0
        }
    },
    loc_txt = {
        ['name'] = 'Roxas',
        ['text'] = {
            [1] = '{C:red}+10{} Mult per ogni carta giocata'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 4
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
        x = 2,
        y = 4
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'jud' and args.source ~= 'rif' 
          or args.source == 'sho' or args.source == 'buf' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = (#(G.playing_cards or {})) * 10,
                message = "Non sapevo che abilità dargli"
            }
        end
    end
}