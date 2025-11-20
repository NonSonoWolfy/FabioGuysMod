
SMODS.Edition {
    key = 'nomeblu',
    shader = 'foil',
    prefix_config = {
        -- This allows using the vanilla shader
        -- Not needed when using your own
        shader = false
    },
    config = {
        extra = {
            chips = 1000
        }
    },
    in_shop = false,
    apply_to_float = true,
    badge_colour = HEX('0091ff'),
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Nome blu',
        label = 'Nome blu',
        text = {
            [1] = '{C:blue}+1000{} Chips'
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
                chips = card.ability.extra.chips,
                message = "Nome blu"
            }
        end
    end
}