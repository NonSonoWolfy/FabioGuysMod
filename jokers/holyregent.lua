SMODS.Joker{ --Holy Regent
    key = "holyregent",
    config = {
        extra = {
            mult = 333
        }
    },
    loc_txt = {
        ['name'] = 'Holy Regent',
        ['text'] = {
            [1] = '{C:red}+333{} Mult alle coppie'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
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
    pools = { ["fgm_fgm_jokers"] = true },
    soul_pos = {
        x = 1,
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
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Pair" then
                return {
                    mult = card.ability.extra.mult,
                    message = "Chaos"
                }
            end
        end
    end
}