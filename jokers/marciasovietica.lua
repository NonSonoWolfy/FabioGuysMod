
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
            [1] = 'Prende il numero delle carte scartate,',
            [2] = 'lo moltiplica per 10 e',
            [3] = 'lo aggiunge a {C:blue}Chips {}e {C:red}Mult{}'
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
    pools = { ["fgm_pacchetti"] = true },
    soul_pos = {
        x = 8,
        y = 4
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {(#(G.discard and G.discard.cards or {})) * 10}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = (#(G.discard and G.discard.cards or {})) * 10,
                message = "PER LA MADREPATRIA",
                extra = {
                    mult = (#(G.discard and G.discard.cards or {})) * 10,
                    message = "PER LA MADREPATRIA"
                }
            }
        end
    end
}