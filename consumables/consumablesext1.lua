local beastball = {
    name = "beastball",
    key = "beastball",
    set = "Spectral",
    pos = { x = 5, y = 5 },
    soul_pos = { x = 6, y = 5},
    atlas = "Mart",
    cost = 4,
    pokeball = true,
    hidden = true,
    soul_set = "Item",
    soul_rate = .003,
    unlocked = true,
    discovered = true,
    can_use = function(self, card)
      if #G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers then
          return true
      else
          return false
      end
    end,
    use = function(self, card, area, copier)
      G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
          play_sound('timpani')
          local _card = create_random_poke_joker("beastball", "Ultra Beast")
          _card:add_to_deck()
          G.jokers:emplace(_card)
          return true end }))
      delay(0.6)
    end
  }

local honey = {
    name = "Honey",
    -- poke_custom_prefix = "poke_ext",
    key = "honey",
    set = "Spectral",
    config = {extra = {card_slots = 1, pack_slots = 1, voucher_slots = 1, id = pokermonexthoney}},
    loc_vars = function(self, info_queue, center)
    end,
    pos = { x = 0, y = 0 },
    atlas = "honey",
    cost = 3,
    unlocked = true,
    discovered = true,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
        func = (function()
            add_tag(Tag('tag_poke_shiny_tag'))
            play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
            play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
            return true
        end)
          }))
    end,
    add_to_deck = function(self, card, from_debuff)
        change_shop_size(card.ability.extra.card_slots)
    end,
    remove_from_deck = function(self, card, from_debuff)
        change_shop_size(-card.ability.extra.card_slots)
    end,
    in_pool = function(self)
        return false
    end,
}
return {name = "Additional Consumables",
list = {beastball, honey,},
}