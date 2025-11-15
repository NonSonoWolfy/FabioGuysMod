SMODS.Joker{ --Marcia Sovietica
    key = "marciasovietica",
    config = {
        extra = {
            cardsindiscard = 0
        }
    },
    loc_txt = {
        ['name'] = 'Marcia Sovietica',
        ['text'] = {
            [1] = 'Prende il numero delle carte scartate',
            [2] = 'e lo aggiunge a {C:blue}Chips {}e {C:red}Mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["fgm_fgm_jokers"] = true },
    soul_pos = {
        x = 8,
        y = 4
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
                chips = #(G.discard and G.discard.cards or {}),
                message = "PER LA MADREPATRIA",
                extra = {
                mult = #(G.discard and G.discard.cards or {}),
                message = "PER LA MADREPATRIA"
            }
        }
    end
end
}