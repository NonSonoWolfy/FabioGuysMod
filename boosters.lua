
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
    weight = 7.2,
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
            set = "fgm_leggendari",
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
        weight = 4.6,
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
                set = "fgm_pacchetti",
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
            key = 's1gm4_44h_p4ck',
            loc_txt = {
                name = "S1gm4 44h p4ck",
                text = {
                    [1] = '{C:uncommon}5 J0k3r{}'
                },
                group_name = "fgm_boosters"
            },
            config = { extra = 5, choose = 1 },
            cost = 200,
            weight = 10,
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
                    set = "Playing Card",
                    edition = "e_fgm_venduto",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "fgm_s1gm4_44h_p4ck"
                }
            end,
            particles = function(self)
                G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
                    timer = 0.015,
                    scale = 0.3,
                    initialize = true,
                    lifespan = 3,
                    speed = 0.2,
                    padding = -1,
                    attach = G.ROOM_ATTACH,
                    colours = { G.C.BLACK, G.C.RED },
                    fill = true
                })
                G.booster_pack_sparkles.fade_alpha = 1
                G.booster_pack_sparkles:fade(1, 0)
            end,
        }
        
        
        SMODS.Booster {
            key = 'sigma_aah_pack',
            loc_txt = {
                name = "Sigma aah pack",
                text = {
                    [1] = '5 joker'
                },
                group_name = "fgm_boosters"
            },
            config = { extra = 5, choose = 5 },
            cost = 50,
            atlas = "CustomBoosters",
            pos = { x = 3, y = 0 },
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
                    set = "fgm_pacchetti",
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
            
            
            SMODS.Booster {
                key = 'nomi_rossi',
                loc_txt = {
                    name = "Nomi rossi",
                    text = {
                        [1] = '{C:red}Ahah sfigato{}'
                    },
                    group_name = "fgm_boosters"
                },
                config = { extra = 3, choose = 1 },
                atlas = "CustomBoosters",
                pos = { x = 4, y = 0 },
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
                        set = "fgm_pacchetti",
                        edition = "e_fgm_bannato",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "fgm_nomi_rossi"
                    }
                end,
                particles = function(self)
                    -- No particles for joker packs
                    end,
                }
                