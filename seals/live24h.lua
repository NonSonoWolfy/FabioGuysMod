
SMODS.Seal {
    key = 'live24h',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            xmult0 = 5
        }
    },
    badge_colour = HEX('000000'),
    loc_txt = {
        name = 'Live 24h',
        label = 'Live 24h',
        text = {
            [1] = '{C:red}x5 {}Mult',
            [2] = 'Distruggi un joker se scartata.'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                Xmult = 5,
                message = "24h"
            }
        end
        if context.discard and context.other_card == card then
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
                message = "24h"
            }
        end
    end
}