
SMODS.Joker{ --Wolfy
    key = "wolfy",
    config = {
        extra = {
            play_size0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Wolfy',
        ['text'] = {
            [1] = '{C:uncommon}Niente ha costo zero{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
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
    pools = { ["fgm_mycustom_jokers"] = true },
    soul_pos = {
        x = 1,
        y = 0
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'sou' and args.source ~= 'uta' 
            or args.source == 'sho' or args.source == 'rif' or args.source == 'rta' or args.source == 'wra'
        )
        and true
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            return {
                func = function()
                    local my_pos = nil
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then
                            my_pos = i
                            break
                        end
                    end
                    local target_joker = nil
                    if my_pos and my_pos > 1 then
                        local joker = G.jokers.cards[my_pos - 1]
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
                                target_joker:shatter({G.C.RED}, nil, 1.6)
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Venduto", colour = G.C.RED})
                    end
                    return true
                end
            }
        end
        if context.buying_card  then
            return {
                message = "Maiale capitalista"
            }
        end
        if context.end_of_round and context.game_over and context.main_eval  then
            return {
                func = function()
                    local target_joker = card
                    
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
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                    end
                    return true
                end,
                extra = {
                    func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_fgm_nonsonowolfy' })
                                if joker_card then
                                    
                                    
                                end
                                
                                return true
                            end
                        }))
                        
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Ultima possibilità", colour = G.C.BLUE})
                        end
                        return true
                    end,
                    colour = G.C.BLUE,
                    extra = {
                        
                        func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Play Size set to "..tostring(1), colour = G.C.BLUE})
                            
                            local current_play_size = (G.GAME.starting_params.play_limit or 0)
                            local target_play_size = 1
                            local difference = target_play_size - current_play_size
                            SMODS.change_play_limit(difference)
                            return true
                        end,
                        colour = G.C.WHITE,
                        extra = {
                            saved = true,
                            message = localize('k_saved_ex'),
                            colour = G.C.RED
                        }
                    }
                }
            }
        end
    end
}