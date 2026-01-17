
SMODS.Joker{ --Il Cugino
    key = "ilcugino",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Il Cugino',
        ['text'] = {
            [1] = 'Quando una mano viene giocata,',
            [2] = 'distrugge il joker alla sua destra e',
            [3] = 'crea un {C:legendary}joker leggendario{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["fgm_leggendari"] = true },
    soul_pos = {
        x = 4,
        y = 6
    },
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            local target_joker = nil
            if my_pos and my_pos < #G.jokers.cards then
                local joker = G.jokers.cards[my_pos + 1]
                if true and not joker.getting_sliced then
                    target_joker = joker
                end
            end
            
            if target_joker then
                if target_joker.ability.eternal then
                    target_joker.ability.eternal = nil
                end
                target_joker.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Tu ti limoni i maschi", colour = G.C.RED})
            end
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Legendary' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            return {
                message = "Redemption Arc"
            }
        end
    end
}