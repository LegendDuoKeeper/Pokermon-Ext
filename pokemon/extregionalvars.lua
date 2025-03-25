poke_custom_prefix = "poke_ext"

local a_vulpix={
    name = "a_vulpix",
    pos = {x = 0, y = 0},
    config = {extra = {odds = 6}},
    rarity = 3,
    cost = 8,
    item_req = "icestone",
    stage = "Basic",
    atlas = "Regional",
    ptype = "Water",
    blueprint_compat = true,
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.c_poke_icestone
        info_queue[#info_queue+1] = G.P_CENTERS.c_aura
        return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                if (context.other_card:get_id() == 9) and (not context.other_card.debuff) and (pseudorandom('a_vulpix') < G.GAME.probabilities.normal/card.ability.extra.odds) then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    return {
                        extra = {focus = card, message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral, func = function()
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = function()
                                    local _card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, 'c_aura')
                                    _card:add_to_deck()
                                    G.consumeables:emplace(_card)
                                    G.GAME.consumeable_buffer = 0
                                return true
                            end}))
                        end},
                    }
                end
            end
        end
        return item_evo(self, card, context, "j_poke_ext_a_ninetales")
    end
}

local a_ninetales={
    name = "a_ninetales",
    pos = {x = 1, y = 0},
    config = {extra = {odds = 9, limit = 1, triggers = 0}},
    rarity = "poke_safari",
    cost = 10,
    stage = "One",
    atlas = "Regional",
    ptype = "Water",
    blueprint_compat = true,
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.e_polychrome
        return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds, center.ability.extra.limit, center.ability.extra.triggers}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if (context.other_card:get_id() == 9) and (not context.other_card.debuff) and (pseudorandom('a_ninetales') < G.GAME.probabilities.normal/card.ability.extra.odds) then
                if card.ability.extra.triggers < card.ability.extra.limit then
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local _card = copy_card(context.other_card, nil, nil, G.playing_card)
                    _card:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, _card)
                    G.hand:emplace(_card)
                    _card.states.visible = nil
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            _card:start_materialize()
                            _card:set_edition({polychrome = true}, true)
                            playing_card_joker_effects({_card})
                            return true
                        end
                    }))
                    card.ability.extra.triggers = card.ability.extra.triggers + 1
                    return {
                        message = localize('k_copied_ex'),
                        colour = G.C.CHIPS,
                        card = card,
                        playing_cards_created = {true}
                    }
                end
            end
        end
        if not context.repetition and not context.individual and context.joker_main then
            card.ability.extra.triggers = 0
        end
    end
}

return {name = "Regional Pokemon Joker 1", 
        list = {a_vulpix, a_ninetales,},
}