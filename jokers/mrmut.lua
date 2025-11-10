SMODS.Joker{ --MrMut
    key = "mrmut",
    config = {
        extra = {
            Jokers = 0,
            jokercount = 0
        }
    },
    loc_txt = {
        ['name'] = 'MrMut',
        ['text'] = {
            [1] = '{C:red}+3{} Mult per ogni Joker'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
    pools = { ["fgm_fgm_jokers"] = true },
    soul_pos = {
        x = 6,
        y = 2
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
            return {
                mult = (#(G.jokers and G.jokers.cards or {})) * 3,
                message = "Astratto"
            }
        end
    end
}