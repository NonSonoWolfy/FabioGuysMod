
SMODS.Consumable {
    key = 'booster_fp9uey',
    set = 'Tarot',
    pos = { x = 1, y = 0 },
    loc_txt = {
        name = '/~',
        text = {
            [1] = '{C:uncommon}Il demone del bosco{}'
        }
    },
    cost = 33,
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
                play_sound('timpani')
                local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_fgm_wolfy' })
                if new_joker then
                    new_joker:set_edition("e_negative", true)
                end
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}