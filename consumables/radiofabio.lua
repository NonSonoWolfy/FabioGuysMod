
SMODS.Consumable {
    key = 'radiofabio',
    set = 'Spectral',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
            dollars0 = 3   
        } 
    },
    loc_txt = {
        name = 'Radio Fabio',
        text = {
            [1] = 'Moltiplica i Dollari per {C:gold}3{}'
        }
    },
    cost = 5,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                
                local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars * 3
                local dollar_value = target_dollars - current_dollars
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "X"..tostring(3).." $", colour = G.C.RED})
                ease_dollars(dollar_value, true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}