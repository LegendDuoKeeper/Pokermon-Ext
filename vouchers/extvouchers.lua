-- Used Only for Giratina
local distortion = {
	key = "distortion",
  yes_pool_flag= "exclusive",
	atlas = "vouchers",
  order = 37,
  set = "Voucher",
	pos = { x = 0, y = 0 },
  config = {},
  discovered = true,
  unlocked = true,
  available = true,
  cost = 10,
	loc_vars = function(self, info_queue)
		return { vars = {} }
	end,
  redeem = function(self)
    if G.GAME.used_vouchers.v_poke_ext_distortion then
      local _card = pseudorandom_element(G.playing_cards, pseudoseed('distortion'))
      _card:set_edition('e_negative', true)
    end
  end,
}

return {name = "Vouchers",
    list = {distortion}
}