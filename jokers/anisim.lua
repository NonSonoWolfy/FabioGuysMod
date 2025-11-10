SMODS.Joker{ --Anisim
    key = "anisim",
    config = {
        extra = {
            dollars = 10
        }
    },
    loc_txt = {
        ['name'] = 'Anisim',
        ['text'] = {
            [1] = '{C:gold}+10{} Dollari se le carte giocate',
            [2] = 'valide sono uguali a 5'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
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
        y = 0
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
        if context.individual and context.cardarea == G.play  then
            if #context.scoring_hand == 5 then
                return {
                    dollars = card.ability.extra.dollars,
                    message = "Clip"
                }
            end
        end
    end
}