
SMODS.Booster {
    key = 'stanza_del_giudizio',
    loc_txt = {
        name = "Stanza del Giudizio",
        text = {
            [1] = '{C:spectral}I fiori sbocciano, gli uccelli cinguettano...{}'
        },
        group_name = "fgm_boosters"
    },
    config = { extra = 3, choose = 1 },
    cost = 100,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    group_key = "fgm_boosters",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "Joker",
            rarity = "Legendary",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "fgm_stanza_del_giudizio"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("4a90e2"))
        ease_background_colour({ new_colour = HEX('4a90e2'), special_colour = HEX("4a90e2"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
        end,
    }
    
    
    SMODS.Booster {
        key = 'nomi_blu',
        loc_txt = {
            name = "Nomi blu",
            text = {
                [1] = 'Rispetta la {C:hearts}Gerarchia{}'
            },
            group_name = "fgm_boosters"
        },
        config = { extra = 3, choose = 1 },
        cost = 30,
        atlas = "CustomBoosters",
        pos = { x = 1, y = 0 },
        group_key = "fgm_boosters",
        discovered = true,
        loc_vars = function(self, info_queue, card)
            local cfg = (card and card.ability) or self.config
            return {
                vars = { cfg.choose, cfg.extra }
            }
        end,
        create_card = function(self, card, i)
            return {
                set = "Joker",
                edition = "e_fgm_nomeblu",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "fgm_nomi_blu"
            }
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX("0073ff"))
            ease_background_colour({ new_colour = HEX('0073ff'), special_colour = HEX("047bff"), contrast = 2 })
        end,
        particles = function(self)
            -- No particles for joker packs
            end,
        }
        
        
        SMODS.Booster {
            key = 'sigma_aah_pack',
            loc_txt = {
                name = "Sigma aah pack",
                text = {
                    [1] = '5 Joker'
                },
                group_name = "fgm_boosters"
            },
            config = { extra = 5, choose = 5 },
            cost = 50,
            atlas = "CustomBoosters",
            pos = { x = 2, y = 0 },
            group_key = "fgm_boosters",
            discovered = true,
            loc_vars = function(self, info_queue, card)
                local cfg = (card and card.ability) or self.config
                return {
                    vars = { cfg.choose, cfg.extra }
                }
            end,
            create_card = function(self, card, i)
                return {
                    set = "Joker",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "fgm_sigma_aah_pack"
                }
            end,
            particles = function(self)
                -- No particles for joker packs
                end,
            }
            