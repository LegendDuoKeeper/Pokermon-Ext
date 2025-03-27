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
}
return {name = "Additional Consumables",
list = {honey,},
}