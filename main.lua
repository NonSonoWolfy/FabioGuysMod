SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomVouchers", 
    path = "CustomVouchers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local jokerIndexList = {33,1,7,2,3,4,5,6,8,12,13,15,19,20,21,30,23,34,24,25,26,27,28,31,18,16,10,11,32,29,17,9,14,22}

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #jokerIndexList do
        local file_name = files[jokerIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end


local consumableIndexList = {2,1}

local function load_consumables_folder()
    local mod_path = SMODS.current_mod.path
    local consumables_path = mod_path .. "/consumables"
    local files = NFS.getDirectoryItemsInfo(consumables_path)
    local set_file_number = #files + 1
    for i = 1, #files do
        if files[i].name == "sets.lua" then
            assert(SMODS.load_file("consumables/sets.lua"))()
            set_file_number = i
        end
    end    
    for i = 1, #consumableIndexList do
        local j = consumableIndexList[i]
        if j >= set_file_number then 
            j = j + 1
        end
        local file_name = files[j].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("consumables/" .. file_name))()
        end
    end
end


local enhancementIndexList = {1}

local function load_enhancements_folder()
    local mod_path = SMODS.current_mod.path
    local enhancements_path = mod_path .. "/enhancements"
    local files = NFS.getDirectoryItemsInfo(enhancements_path)
    for i = 1, #enhancementIndexList do
        local file_name = files[enhancementIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("enhancements/" .. file_name))()
        end
    end
end


local editionIndexList = {2,1,3}

local function load_editions_folder()
    local mod_path = SMODS.current_mod.path
    local editions_path = mod_path .. "/editions"
    local files = NFS.getDirectoryItemsInfo(editions_path)
    for i = 1, #editionIndexList do
        local file_name = files[editionIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("editions/" .. file_name))()
        end
    end
end


local voucherIndexList = {1}

local function load_vouchers_folder()
    local mod_path = SMODS.current_mod.path
    local vouchers_path = mod_path .. "/vouchers"
    local files = NFS.getDirectoryItemsInfo(vouchers_path)
    for i = 1, #voucherIndexList do
        local file_name = files[voucherIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("vouchers/" .. file_name))()
        end
    end
end


local deckIndexList = {2,1}

local function load_decks_folder()
    local mod_path = SMODS.current_mod.path
    local decks_path = mod_path .. "/decks"
    local files = NFS.getDirectoryItemsInfo(decks_path)
    for i = 1, #deckIndexList do
        local file_name = files[deckIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("decks/" .. file_name))()
        end
    end
end

function SMODS.current_mod.reset_game_globals(run_start)
    local jokerPool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Joker' then
            if (not v.mod) then
                G.GAME.banned_keys[k] = true
            end
        end
    end
end


local function load_boosters_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("boosters.lua"))()
end

load_boosters_file()
load_jokers_folder()
load_consumables_folder()
load_enhancements_folder()
load_editions_folder()
load_vouchers_folder()
load_decks_folder()
SMODS.ObjectType({
    key = "fgm_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "fgm_pacchetti",
    cards = {
        ["j_fgm_anisim"] = true,
        ["j_fgm_axiakos"] = true,
        ["j_fgm_beelze"] = true,
        ["j_fgm_dema"] = true,
        ["j_fgm_floppydisk"] = true,
        ["j_fgm_holyregent"] = true,
        ["j_fgm_justjai"] = true,
        ["j_fgm_losburro"] = true,
        ["j_fgm_lynx"] = true,
        ["j_fgm_marciasovietica"] = true,
        ["j_fgm_mettaton"] = true,
        ["j_fgm_mrmut"] = true,
        ["j_fgm_myle"] = true,
        ["j_fgm_odra"] = true,
        ["j_fgm_roxas"] = true,
        ["j_fgm_samus"] = true,
        ["j_fgm_stefano"] = true,
        ["j_fgm_tokiko"] = true,
        ["j_fgm_yosuke"] = true
    },
})

SMODS.ObjectType({
    key = "fgm_fgm_jokers",
    cards = {
        ["j_fgm_auda"] = true,
        ["j_fgm_coppergolem"] = true,
        ["j_fgm_demonblad"] = true,
        ["j_fgm_floppyfurry"] = true,
        ["j_fgm_nonsonowolfy"] = true,
        ["j_fgm_ohikkigaya"] = true
    },
})

SMODS.ObjectType({
    key = "fgm_leggendari",
    cards = {
        ["j_fgm_chara"] = true,
        ["j_fgm_fabionenazionale"] = true,
        ["j_fgm_gattodelfuocogiallo"] = true,
        ["j_fgm_ilcugino"] = true,
        ["j_fgm_quackquack"] = true,
        ["j_fgm_rak"] = true,
        ["j_fgm_sonoharuu"] = true,
        ["j_fgm_toninogg"] = true
    },
})

SMODS.ObjectType({
    key = "fgm_mycustom_jokers",
    cards = {
        ["j_fgm_wolfy"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end