
SMODS.Joker{ --CopperGolem
    key = "coppergolem",
    config = {
        extra = {
            no = 0,
            var1 = 0,
            start_dissolve = 0
        }
    },
    loc_txt = {
        ['name'] = 'CopperGolem',
        ['text'] = {
            [1] = 'Non fa un emerito cazzo'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1000,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["fgm_fgm_jokers"] = true },
    soul_pos = {
        x = 5,
        y = 1
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
        if context.cardarea == G.jokers and context.joker_main  then
            local destructable_jokers = {}
            for i, joker in ipairs(G.jokers.cards) do
                if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                    table.insert(destructable_jokers, joker)
                end
            end
            local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
            
            if target_joker then
                target_joker.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "lmao", colour = G.C.RED})
            end
        end
    end
}