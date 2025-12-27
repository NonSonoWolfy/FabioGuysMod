
SMODS.Enhancement {
    key = 'backdoor',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            xchips0 = 10,
            xmult0 = 10
        }
    },
    loc_txt = {
        name = 'Backdoor',
        text = {
            [1] = '{C:blue}x10 {}Chips. {C:red}x10{} Mult.'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                x_chips = 10,
                message = "Backdoor",
                extra = {
                    Xmult = 10,
                    message = "Backdoor"
                }
            }
        end
    end
}