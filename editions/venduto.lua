
SMODS.Shader({ key = 'overexposed', path = 'overexposed.fs' })

SMODS.Edition {
    key = 'venduto',
    shader = 'overexposed',
    config = {
        extra = {
            xmult0 = 10000000000000000,
            xchips0 = 10000000000000000
        }
    },
    in_shop = false,
    weight = 20,
    apply_to_float = false,
    badge_colour = HEX('349350'),
    sound = { sound = "explosion1", per = 1.2, vol = 0.4 },
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Venduto',
        label = 'Venduto',
        text = {
            [1] = '{C:green}Niente da vedere qui{}'
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
            return {
                Xmult = 10000000000000000,
                extra = {
                    x_chips = 10000000000000000,
                    colour = G.C.DARK_EDITION
                }
            }
        end
    end
}