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
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local jokerIndexList = {23,1,7,2,3,4,5,6,8,9,10,11,12,13,14,21,15,24,16,17,18,19,20,22}

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


local editionIndexList = {1}

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
load_editions_folder()
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
    key = "fgm_fgm_jokers",
    cards = {
        ["j_fgm_anisim"] = true,
        ["j_fgm_auda"] = true,
        ["j_fgm_axiakos"] = true,
        ["j_fgm_beelze"] = true,
        ["j_fgm_chara"] = true,
        ["j_fgm_coppergolem"] = true,
        ["j_fgm_dema"] = true,
        ["j_fgm_demonblad"] = true,
        ["j_fgm_gattodelfuocogiallo"] = true,
        ["j_fgm_holyregent"] = true,
        ["j_fgm_justjai"] = true,
        ["j_fgm_mettaton"] = true,
        ["j_fgm_mrmut"] = true,
        ["j_fgm_myle"] = true,
        ["j_fgm_odra"] = true,
        ["j_fgm_ohikkigaya"] = true,
        ["j_fgm_quackquack"] = true,
        ["j_fgm_rak"] = true,
        ["j_fgm_roxas"] = true,
        ["j_fgm_samus"] = true,
        ["j_fgm_stefano"] = true,
        ["j_fgm_tokiko"] = true,
        ["j_fgm_yosuke"] = true
    },
})

SMODS.ObjectType({
    key = "fgm_mycustom_jokers",
    cards = {
        ["j_fgm_wolfy"] = true
    },
})