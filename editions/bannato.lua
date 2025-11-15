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
            x_chips = -2,
            x_mult = 2
        }
    },
    in_shop = false,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Bannato',
        label = 'Bannato',
        text = {
        [1] = '{C:blue}/2 {}Chips.',
        [2] = '{C:red}*2{} Mult.'
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
            return { x_chips = card.edition.extra.x_chips, x_mult = card.edition.extra.x_mult }
        end
    end
}