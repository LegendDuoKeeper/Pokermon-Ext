local honey = {
    name = "Honey",
    -- poke_custom_prefix = "poke_ext",
    key = "honey",
    set = "Item",
    config = {extra = {card_slots = 1, pack_slots = 1, voucher_slots = 1, id = pokermonexthoney}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"DaleWillFail"}}
        info_queue[#info_queue+1] = {set = 'Other', key = 'poke_ext_honey_table'}
    end,
    pos = { x = 2, y = 0 },
    atlas = "Items",
    cost = 3,
    unlocked = true,
    discovered = true,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local randomtag = pseudorandom('honey')
        local tag = 'tag_poke_shiny_tag'
        if randomtag < .40 then tag = 'tag_uncommon'
        elseif randomtag < .65 then tag = 'tag_poke_stage_one_tag'
        elseif randomtag < .80 then tag = 'tag_rare'
        elseif randomtag < .90 then tag = 'tag_poke_safari_tag'
        end
        G.E_MANAGER:add_event(Event({
        func = (function()
            add_tag(Tag(tag))
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
list = {honey,},
}