
SMODS.Enhancement {
    key = 'boost',
    pos = { x = 1, y = 0 },
    config = {
        h_mult = 4,
        extra = {
            xchips0 = 3,
            dollars0 = 10
        }
    },
    loc_txt = {
        name = 'Boost',
        text = {
            [1] = '{C:blue}x3 {}Chips se giocata',
            [2] = '{C:gold}+10{} Chips se scartata',
            [3] = '{C:hearts}+30{} Mult se tenuta in mano',
            [4] = 'Crea un joker {C:tarot}negativo {}se tenuta',
            [5] = 'in mano alla fine del round',
            [6] = 'Non serve spazio'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 12.75,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                x_chips = 3,
                message = "Algoritmo"
            }
        end
        if context.discard and context.other_card == card then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 10
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Algoritmo", colour = G.C.MONEY})
                    return true
                end
            }
        end
        if context.end_of_round and context.cardarea == G.hand and context.other_card == card and context.individual then
            local created_joker = false
            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                created_joker = true
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker' })
                        if joker_card then
                            joker_card:set_edition("e_negative", true)
                            
                        end
                        G.GAME.joker_buffer = 0
                        return true
                    end
                }))
            end
            return {
                message = "Algoritmo"
            }
        end
    end
}