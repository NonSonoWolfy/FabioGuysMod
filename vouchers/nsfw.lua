
SMODS.Voucher {
    key = 'nsfw',
    pos = { x = 1, y = 0 },
    loc_txt = {
        name = 'NSFW',
        text = {
            [1] = 'Crea un joker a round',
            [2] = 'Non serve spazio'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 50,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
        end
    end
}