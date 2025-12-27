
SMODS.Edition {
    key = 'bannato',
    shader = 'debuff',
    prefix_config = {
        -- This allows using the vanilla shader
        -- Not needed when using your own
        shader = false
    },
    config = {
        extra = {
            xmult0 = 10
        }
    },
    in_shop = false,
    weight = 20,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Bannato',
        label = 'Bannato',
        text = {
            [1] = '{C:red}*10{} Mult',
            [2] = 'Distruggi un Joker'
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            local destructable_jokers = {}
            for i, joker in ipairs(G.jokers.cards) do
                if not joker.ability.eternal and not joker.getting_sliced then
                    table.insert(destructable_jokers, joker)
                end
            end
            local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker_enhanced')) or nil
            
            if target_joker then
                target_joker.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                        return true
                    end
                }))
            end
            return {
                Xmult = 10,
                extra = {
                    message = "Bannato",
                    colour = G.C.RED
                }
            }
        end
    end
}