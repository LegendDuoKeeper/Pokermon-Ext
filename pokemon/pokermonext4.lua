-- Giratina 487
local giratina={
  name = "giratina",
  no_pool_flag="giratina_sold",
  pos = {x = 0, y = 8},
  soul_pos = { x = 1, y = 8},
  config = {extra = {}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = G.P_CENTERS.v_poke_ext_distortion
    return {vars = {}}
  end,
  rarity = 4,
  cost = 20,
  giratina = true,
  stage = "Legendary",
  ptype = "Psychic",
  atlas = "Pokedex4",
  perishable_compat = false,
  blueprint_compat = false,
  eternal_compat = false,
  calculate = function(self, card, context)
    if context.selling_self then
      if G.GAME.pool_flags.giratina_sold == false then
        G.GAME.pool_flags.giratina_sold = true
      end
      if G.shop_vouchers and G.shop_vouchers.cards then 
      local distortion_in_shop = false
        if not distortion_in_shop then
          for i = 1, #G.shop_vouchers.cards do
            if G.shop_vouchers.cards[i].ability.name == "distortion" then
              distortion_in_shop = true
            end
          end
          if not G.GAME.used_vouchers.v_poke_ext_distortion and not distortion_in_shop then
            G.shop_vouchers.config.card_limit = G.shop_vouchers.config.card_limit + 1
            local _card = Card(G.shop_vouchers.T.x + G.shop_vouchers.T.w/2,
            G.shop_vouchers.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS['v_poke_ext_distortion'],{bypass_discovery_center = true, bypass_discovery_ui = true})
            create_shop_card_ui(_card, 'Voucher', G.shop_vouchers)
            _card:start_materialize()
            G.shop_vouchers:emplace(_card)
            added = true
          end
        end
      end
    end
  end,
--   in_pool = function(self, args)
--     return SMODS.Mods.poke_ext.config.enable_giratina
--   end
}

return {name = "Various Additional Jokers",

list = {giratina,},
}