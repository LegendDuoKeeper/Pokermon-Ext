poke_custom_prefix = "poke_ext"

local a_vulpix={
    name = "a_vulpix",
    pos = {x = 0, y = 0},
    config = {extra = {odds = 4, limit = 1, triggers = 0}},
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
        if not center.edition or (center.edition and not center.edition.polychrome) then
          info_queue[#info_queue+1] = G.P_CENTERS.e_polychrome
        end
        if not center.edition or (center.edition and not center.edition.foil) then
          info_queue[#info_queue+1] = G.P_CENTERS.e_foil
        end
        if not center.edition or (center.edition and not center.edition.holo) then
          info_queue[#info_queue+1] = G.P_CENTERS.e_holo
        end
        info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"TekkyAnonymous"}}
        return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds, center.ability.extra.limit, center.ability.extra.triggers}}
    end,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers and not context.blueprint then
            for k, v in ipairs(context.scoring_hand) do
                if(v:get_id() == 9) and (not v.debuff) and (pseudorandom('a_vulpix') < G.GAME.probabilities.normal/card.ability.extra.odds) then
                    local edition = poll_edition('aura', nil, true, true)
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.5,
                        func = function()
                            v:set_edition(edition, true, true)
                            v:juice_up()
                            return true
                        end
                    }))
                    return {
                        message = localize('k_aurora_veil_ex'),
                        colour = G.C.CHIPS
                    }
                end
            end
        end
        if not context.repetition and not context.individual and context.joker_main then
            card.ability.extra.triggers = 0
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
        info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"TekkyAnonymous"}}
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
                        trigger = 'before',
                        delay = 0.5,
                        func = function()
                            _card:start_materialize()
                            playing_card_joker_effects({_card})
                            _card:set_edition({polychrome = true}, true)
                            return true
                        end
                    }))
                    card.ability.extra.triggers = card.ability.extra.triggers + 1
                    return {
                        message = localize('k_aurora_veil_ex'),
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