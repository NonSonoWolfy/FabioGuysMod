
SMODS.Voucher {
    key = 'bot',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
            dollars0 = 50
        } 
    },
    loc_txt = {
        name = 'Bot',
        text = {
            [1] = '{C:money}+50{} Dollari per round'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 50
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value, true)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Bot", colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}