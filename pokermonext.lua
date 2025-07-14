default_poke_custom_prefix = "poke_ext"

-- SMODS.Atlas({
--   key = "Pokedex2",
--   path = "Pokedex2.png",
  
--   px = 71,
--   py = 95
-- }):register()

-- SMODS.Atlas({
--   key = "shiny_Pokedex2",
--   path = "shiny_Pokedex2.png",
  
--   px = 71,
--   py = 95
-- }):register()

SMODS.Atlas({
  key = "Pokedex3",
  path = "Pokedex3.png",
  
  px = 71,
  py = 95
}):register()

SMODS.Atlas({
  key = "shiny_Pokedex3",
  path = "shiny_Pokedex3.png",
  
  px = 71,
  py = 95
}):register()

SMODS.Atlas({
  key = "Pokedex4",
  path = "Pokedex4.png",
  
  px = 71,
  py = 95
}):register()

SMODS.Atlas({
  key = "shiny_Pokedex4",
  path = "shiny_Pokedex4.png",
  
  px = 71,
  py = 95
}):register()

SMODS.Atlas({
    key = "Pokedex5",
    path = "Pokedex5.png",
    
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
  key = "shiny_Pokedex5",
  path = "shiny_Pokedex5.png",
  
  px = 71,
  py = 95
}):register()

SMODS.Atlas({
  key = "Pokedex6",
  path = "Pokedex6.png",
  
  px = 71,
  py = 95
}):register()

SMODS.Atlas({
  key = "shiny_Pokedex6",
  path = "shiny_Pokedex6.png",
  
  px = 71,
  py = 95
}):register()

SMODS.Atlas({
  key = "Pokedex7",
  path = "Pokedex7.png",
  
  px = 71,
  py = 95
}):register()

SMODS.Atlas({
  key = "shiny_Pokedex7",
  path = "shiny_Pokedex7.png",
  
  px = 71,
  py = 95
}):register()

SMODS.Atlas({
  key = "Pokedex8",
  path = "Pokedex8.png",
  
  px = 71,
  py = 95
}):register()

SMODS.Atlas({
  key = "shiny_Pokedex8",
  path = "shiny_Pokedex8.png",

  px = 71,
  py = 95
}):register()

SMODS.Atlas({
  key = "Pokedex9",
  path = "Pokedex9.png",
  
  px = 71,
  py = 95
}):register()

SMODS.Atlas({
  key = "shiny_Pokedex9",
  path = "shiny_Pokedex9.png",
  
  px = 71,
  py = 95
}):register()

SMODS.Atlas({
  key = "Megas",
  path = "Megas.png",
  
  px = 71,
  py = 95
}):register()

SMODS.Atlas({
  key = "shiny_Megas",
  path = "shiny_Megas.png",
  
  px = 71,
  py = 95
}):register()

SMODS.Atlas({
  key = "Regionals",
  path = "Regionals.png",
  
  px = 71,
  py = 95
}):register()

SMODS.Atlas({
  key = "shiny_Regionals",
  path = "shiny_Regionals.png",
  
  px = 71,
  py = 95
}):register()

-- Only Used for Giratina
SMODS.Atlas({
  key = "vouchers",
  path = "vouchers.png",
  
  px = 71,
  py = 95
}):register()

-- Load Placeholder
SMODS.Atlas({
  key = "placeholder",
  path = "placeholder_item.png",
  
  px = 71,
  py = 95
}):register()

-- Load Honey
SMODS.Atlas({
  key = "honey",
  path = "honey_item.png",
  
  px = 71,
  py = 95
}):register()

-- Load Items
SMODS.Atlas({
  key = "Items",
  path = "Items.png",
  
  px = 71,
  py = 95
}):register()

-- Load Placeholder seals
SMODS.Atlas({
  key = "seals1",
  path = "seals1.png",
  
  px = 71,
  py = 95
}):register()

--Required by the pokemon pokermon.family function (right click on a pokemon joker)
table.insert(pokermon.family, {"petilil", "lilligant", "lilliganth"})
table.insert(pokermon.family, {"joltik", "galvantula"})
table.insert(pokermon.family, {"diancie", "mega_diancie"})
table.insert(pokermon.family, {"cutiefly", "ribombee"})
table.insert(pokermon.family, {"rockruff", "lycanroc", "lycanrocn", "lycanrocd"})
table.insert(pokermon.family, {"fomantis", "lurantis"})

table.insert(pokermon.family, {"giratina"})
table.insert(pokermon.family, {"carbink"})

table.insert(pokermon.family, {"a_vulpix", "a_ninetales"})

table.insert(pokermon.family, {"munna", "musharna"})
table.insert(pokermon.family, {"mareanie", "toxapex"})
table.insert(pokermon.family, {"sizzlipede", "centiskorch"})
table.insert(pokermon.family, {"snom", "frosmoth"})
table.insert(pokermon.family, {"tadbulb", "bellibolt"})
table.insert(pokermon.family, {"sneaselh", "sneasler"})

-- Get mod path and load other files
mod_dir = ''..SMODS.current_mod.path
pokermon_ext_config = SMODS.current_mod.config

-- --Load helper function files
-- local helper, load_error = SMODS.load_file("functions/extfunctions.lua")
-- if load_error then
--   sendDebugMessage ("The error is: "..load_error)
-- else
--   helper()
-- end

-- Load vouchers (Only used for Giratina's Voucher)
local vouchers = NFS.getDirectoryItems(mod_dir .. "vouchers")

for _, file in ipairs(vouchers) do
  sendDebugMessage("The file is: " .. file)
  local voucher, load_error = SMODS.load_file("vouchers/" .. file)
  if load_error then
    sendDebugMessage("The error is: " .. load_error)
  else
    local curr_voucher = voucher()
    if curr_voucher.init then curr_voucher:init() end

    for i, item in ipairs(curr_voucher.list) do
      if not (item.giratina and not SMODS.Mods.Pokermon_Ext.config.enable_giratina) then
        item.discovered = not pokermon_config.pokemon_discovery
        SMODS.Voucher(item)
      end
    end
  end
end

--Load consumables
local pconsumables = NFS.getDirectoryItems(mod_dir.."consumables")

for _, file in ipairs(pconsumables) do
  sendDebugMessage ("The file is: "..file)
  local consumable, load_error = SMODS.load_file("consumables/"..file)
  if load_error then
    sendDebugMessage ("The error is: "..load_error)
  else
    local curr_consumable = consumable()
    if curr_consumable.init then curr_consumable:init() end
    
    for i, item in ipairs(curr_consumable.list) do
      if not (item.pokeball and not pokermon_config.pokeballs) then
        if not (item.experiment and not SMODS.Mods.Pokermon_Ext.config.experimental_content) then
          item.discovered = not pokermon_config.pokemon_discovery
          item.poke_custom_prefix = default_poke_custom_prefix
          SMODS.Consumable(item)
        end
      end
    end
  end
end 

--Load pokemon file
local pfiles = NFS.getDirectoryItems(mod_dir.."pokemon")

for _, file in ipairs(pfiles) do
  sendDebugMessage ("The file is: "..file)
  local pokemon, load_error = SMODS.load_file("pokemon/"..file)
  if load_error then
    sendDebugMessage ("The error is: "..load_error)
  else
    local curr_pokemon = pokemon()
    if curr_pokemon.init then curr_pokemon:init() end
    
    if curr_pokemon.list and #curr_pokemon.list > 0 then
      for i, item in ipairs(curr_pokemon.list) do
        if (pokermon_config.jokers_only and not item.joblacklist) or not pokermon_config.jokers_only then
          if not (item.giratina and not SMODS.Mods.Pokermon_Ext.config.enable_giratina) then
            if not (item.experiment and not SMODS.Mods.Pokermon_Ext.config.experimental_content) then
              item.discovered = true
              if not item.key then
                item.key = item.name
              end
              if not pokermon_config.no_evos and not item.custom_pool_func then
                item.in_pool = function(self)
                  return pokemon_in_pool(self)
                end
              end
              if not item.config then
                item.config = {}
              end
              if item.ptype then
                if item.config and item.config.extra then
                  item.config.extra.ptype = item.ptype
                elseif item.config then
                  item.config.extra = {ptype = item.ptype}
                end
              end
              if item.item_req then
                if item.config and item.config.extra then
                  item.config.extra.item_req = item.item_req
                elseif item.config then
                  item.config.extra = {item_req = item.item_req}
                end
              end
              if item.evo_list then
                if item.config and item.config.extra then
                  item.config.extra.evo_list = item.evo_list
                elseif item.config then
                  item.config.extra = {item_req = item.evo_list}
                end
              end
              if pokermon_config.jokers_only and item.rarity == "poke_safari" then
                item.rarity = 3
              end
              item.poke_custom_prefix = default_poke_custom_prefix
              item.discovered = not pokermon_config.pokemon_discovery 
              SMODS.Joker(item)
            end
          end
        end
      end
    end
  end
end

--Load seals
local pseals = NFS.getDirectoryItems(mod_dir.."seals")

for _, file in ipairs(pseals) do
  sendDebugMessage ("The file is: "..file)
  local seal, load_error = SMODS.load_file("seals/"..file)
  if load_error then
    sendDebugMessage ("The error is: "..load_error)
  else
    local curr_seal = seal()
    if curr_seal.init then curr_seal:init() end
    
    for i, item in ipairs(curr_seal.list) do
      if not (item.experiment and not SMODS.Mods.Pokermon_Ext.config.experimental_content) then
        item.discovered = not pokermon_config.pokemon_discovery
        SMODS.Seal(item)
      end
    end
  end
end

-- Load UI file
local UI, load_error = SMODS.load_file("extui.lua")
if load_error then
  sendDebugMessage ("The error is: "..load_error)
else
  UI()
end

-- Code for Giratina Voucher
SMODS.Tarot:take_ownership ('death',
{
in_pool = function(self) 
  if G.GAME.used_vouchers.v_poke_ext_distortion then 
    return false
    else
    return true
  end
end
},
true
)
-- Code for nerfing Metal Coat with Giratina
SMODS.Consumable:take_ownership ('poke_metalcoat',
{
  use = function(self, card, area, copier)
    set_spoon_item(card)
    local choice = nil
    if G.jokers.highlighted and #G.jokers.highlighted == 1 then
      choice = G.jokers.highlighted[1]
    elseif G.jokers and G.jokers.cards and #G.jokers.cards > 0 then
      choice = G.jokers.cards[1]
    end
    
    if choice then
      apply_type_sticker(choice, "Metal")
      card_eval_status_text(choice, 'extra', nil, nil, nil, {message = localize("poke_metal_ex"), colour = G.ARGS.LOC_COLOURS["metal"]})
    end

    local copy = copy_card(G.hand.highlighted[1], nil, nil, G.playing_card)
    copy:set_ability(G.P_CENTERS.m_steel, nil, true)
    if copy.edition and copy.edition.negative then
      copy:set_edition(nil, true)
    end
    poke_add_card(copy, card)
  end,
  },
  true
)
