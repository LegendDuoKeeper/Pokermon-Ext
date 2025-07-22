-- default_poke_custom_prefix = "poke_ext"

local dream_mist = {
    name = "Dream Mist",
    -- poke_custom_prefix = "poke_ext",
    key = "dream_mist",
    set = "Item",
    config = {max_highlighted = 2, min_highlighted = 1},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"DaleWillFail"}}
        info_queue[#info_queue+1] = {set = 'Other', key = 'poke_ext_sleep_seal'}
    end,
    pos = { x = 0, y = 0 },
    atlas = "placeholder",
    cost = 3,
    experiment = true,
    unlocked = true,
    discovered = true,
    soul_set = "Item",
    soul_rate = .05,
    can_use = function(self, card)
        local no_seals = true
        local useable = false
        if G.hand.highlighted and #G.hand.highlighted >= self.config.min_highlighted and #G.hand.highlighted <= self.config.max_highlighted then
            for k, v in ipairs(G.hand.highlighted) do
                    if v.seal ~= nil then
                        no_seals = false
                    end
            end
            if no_seals == true then
                useable = true
            end
        end
        return useable
    end,
    use = function(self, card, area, copier)
        set_spoon_item(card)
        if (#G.consumeables.cards + G.GAME.consumeable_buffer < (G.consumeables.config.card_limit)) then
            -- print(G.consumeables.config.card_limit)
                local _card = create_card('Energy', G.consumeables, nil, nil, nil, nil, 'c_poke_colorless_energy')
                _card:add_to_deck()
                G.consumeables:emplace(_card)
        end
        if #G.hand.highlighted >= self.config.min_highlighted then
            for i = 1, #G.hand.highlighted do
                G.hand.highlighted[i]:set_seal("poke_ext_sleep", true)
            end
        poke_unhighlight_cards()
        end
    end,
}
local charcoal = {
    name = "Charcoal",
    -- poke_custom_prefix = "poke_ext",
    key = "charcoal",
    set = "Item",
    config = {max_highlighted = 2, min_highlighted = 1},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"DaleWillFail"}}
        info_queue[#info_queue+1] = {key = 'poke_ext_burned_seal', set = 'Other'}
    end,
    pos = { x = 0, y = 0 },
    atlas = "placeholder",
    cost = 3,
    experiment = true,
    unlocked = true,
    discovered = true,
    soul_set = "Item",
    soul_rate = .05,
    can_use = function(self, card)
        local no_seals = true
        if G.hand.highlighted and #G.hand.highlighted >= self.config.min_highlighted and #G.hand.highlighted <= self.config.max_highlighted then
            for k, v in ipairs(G.hand.highlighted) do
                if v.seal ~= nil then
                    no_seals = false
                end
            end
        end
        return no_seals
    end,
    use = function(self, card, area, copier)
        set_spoon_item(card)
        if #G.hand.highlighted >= self.config.min_highlighted then
            for i = 1, #G.hand.highlighted do
                G.hand.highlighted[i]:set_seal("poke_ext_burned", true)
                if G.hand.highlighted[i].ability.perma_mult < 6 then
                    G.hand.highlighted[i].ability.perma_mult = G.hand.highlighted[i].ability.perma_mult + 6
                end
            end
        poke_unhighlight_cards()
        end
    end,
}
local magnet = {
    name = "Magnet",
    -- poke_custom_prefix = "poke_ext",
    key = "magnet",
    set = "Item",
    config = {max_highlighted = 2, min_highlighted = 1, odds = 4},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"DaleWillFail"}}
        return {vars ={G.GAME and G.GAME.probabilities.normal or 1, center.ability.odds}}
    end,
    pos = { x = 1, y = 0 },
    atlas = "Items",
    cost = 3,
    experiment = true,
    unlocked = true,
    discovered = true,
    soul_set = "Item",
    soul_rate = .05,
    can_use = function(self, card)
        local no_seals = true
        if G.hand.highlighted and #G.hand.highlighted >= self.config.min_highlighted and #G.hand.highlighted <= self.config.max_highlighted then
            for k, v in ipairs(G.hand.highlighted) do
                if v.seal ~= nil then
                    no_seals = false
                end
            end
        end
        return no_seals
    end,
    use = function(self, card, area, copier)
        set_spoon_item(card)
        if #G.hand.highlighted >= self.config.min_highlighted then
            for i = 1, #G.hand.highlighted do
                G.hand.highlighted[i]:set_seal("poke_ext_para", true)
            end
        poke_unhighlight_cards()
        end
        local targets = {}
        for k, v in ipairs(G.hand.cards) do
            if v.seal ~= nil then
            table.insert(targets, v)
            end
        end
        if next(targets) ~= nil then
            local target = pseudorandom_element(targets, pseudoseed('magnet_steel'))
            target:set_ability('m_steel', true)
        end
    end,
}
local nevermeltice = {
    name = "NeverMeltIce",
    -- poke_custom_prefix = "poke_ext",
    key = "nevermeltice",
    set = "Item",
    config = {max_highlighted = 2, min_highlighted = 1, extra = {make_tag = true}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"DaleWillFail"}}
        info_queue[#info_queue+1] = {key = 'poke_ext_frozen_seal', set = 'Other'}
    end,
    pos = { x = 0, y = 0 },
    atlas = "placeholder",
    cost = 3,
    experiment = true,
    unlocked = true,
    discovered = true,
    soul_set = "Item",
    soul_rate = .05,
    can_use = function(self, card)
        local no_seals = true
        local useable = false
        if G.hand.highlighted and #G.hand.highlighted >= self.config.min_highlighted and #G.hand.highlighted <= self.config.max_highlighted then
            for k, v in ipairs(G.hand.highlighted) do
                    if v.seal ~= nil then
                        no_seals = false
                    end
            end
            if no_seals == true then
                useable = true
            end
        end
        return useable
    end,
    use = function(self, card, area, copier)
        set_spoon_item(card)
        if #G.hand.highlighted >= self.config.min_highlighted then
            for i = 1, #G.hand.highlighted do
                G.hand.highlighted[i]:set_seal("poke_ext_frozen", true)
            end
        poke_unhighlight_cards()
        end
        for i, v in ipairs(G.GAME.tags) do
            if v.key == "tag_foil" then
                card.ability.extra.make_tag = false
            end
        end
                
        if card.ability.extra.make_tag == true then 
            G.E_MANAGER:add_event(Event({
            func = (function()
                add_tag(Tag('tag_foil'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                return true
            end)
            }))
        end
    end,
}
local poison_barb = {
    name = "Poison Barb",
    -- poke_custom_prefix = "poke_ext",
    key = "poison_barb",
    set = "Item",
    config = {max_highlighted = 2, min_highlighted = 1},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"Beoulve"}}
        info_queue[#info_queue+1] = {set = 'Other', key = 'poke_ext_poison_seal',}
    end,
    pos = { x = 0, y = 0 },
    atlas = "Items",
    cost = 3,
    experiment = true,
    unlocked = true,
    discovered = true,
    soul_set = "Item",
    soul_rate = .05,
    can_use = function(self, card)
        local no_seals = true
        if G.hand.highlighted and #G.hand.highlighted >= self.config.min_highlighted and #G.hand.highlighted <= self.config.max_highlighted then
            for k, v in ipairs(G.hand.highlighted) do
                if v.seal ~= nil then
                    no_seals = false
                end
            end
        end
        return no_seals
    end,
    use = function(self, card, area, copier)
        set_spoon_item(card)
        if #G.hand.highlighted >= self.config.min_highlighted then
            for i = 1, #G.hand.highlighted do
                G.hand.highlighted[i]:set_seal("poke_ext_poison", true)
            end
        poke_unhighlight_cards()
        end
        local targets = {}
        for k, v in ipairs(G.hand.cards) do
            if v.seal == nil then
            table.insert(targets, v)
            end
        end
        if next(targets) ~= nil then
            local target = pseudorandom_element(targets, pseudoseed('barb_destroy'))
            G.E_MANAGER:add_event(Event{
            trigger = 'after',
            delay = 0.3,
            func = function()
              target:start_dissolve({G.C.RED}, nil, 1.6)
              return true end
          })
        end
    end,
}
return {name = "Additional Consumables",
list = {dream_mist, charcoal, magnet, nevermeltice, poison_barb,},
}