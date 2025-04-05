poke_custom_prefix = "poke_ext"
-- Shaymin-Land 492
local shaymin_land={
  name = "shaymin_land",
  poke_custom_prefix = "poke_ext",
  pos = {x = 10, y = 8},
  soul_pos = {x = 11, y = 8},
  config = { extra = { Xmult = 1, eaten = 0, Xmult_mod = 0.005 }, evo_req = 20 },
  rarity = 4,
  cost = 20,
  stage = "Legendary",
  ptype = "Grass",
  atlas = "Pokedex4",
  blueprint_compat = true,
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"TekkyAnonymous"}}
    return { vars = {center.ability.extra.Xmult_mod, center.ability.extra.Xmult, center.ability.extra.eaten, center.ability.evo_req }}
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before and not context.blueprint then
      for k, v in ipairs(context.scoring_hand) do
        if v.config.center ~= G.P_CENTERS.c_base and not v.debuff and not v.vampired then
          card.ability.extra.Xmult = card.ability.extra.Xmult + ((v.ability.bonus + v.base.nominal) * card.ability.extra.Xmult_mod)
          card.ability.extra.eaten = card.ability.extra.eaten + 1
          v.vampired = true
          v:set_ability(G.P_CENTERS.c_base, nil, true)
          G.E_MANAGER:add_event(Event({
            func = function()
              v:juice_up()
              v.vampired = nil
              return true
            end
          }))
        end
      end
    elseif context.joker_main and card.ability.extra.Xmult > 1.0 then
      return {
        message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
        colour = G.C.XMULT,
        Xmult_mod = card.ability.extra.Xmult
      }
    end
    return scaling_evo(self, card, context, "j_poke_ext_shaymin_sky", card.ability.extra.eaten, self.config.evo_req)
  end
}
-- Shaymin-Sky 492*
local shaymin_sky={
  name = "shaymin_sky",
  poke_custom_prefix = "poke_ext",
  pos = {x = 9, y = 10},
  soul_pos = {x = 3, y = 10},
  config = { extra = { Xmult = 1.5, Xmult_mod = 0.005 }},
  rarity = 4,
  cost = 20,
  stage = "Legendary",
  ptype = "Grass",
  atlas = "Pokedex4",
  blueprint_compat = true,
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"TekkyAnonymous"}}
    return {vars = {center.ability.extra.Xmult}}
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.play and context.individual and card.ability.extra.Xmult > 1.0 then
      if context.other_card.config.center ~= G.P_CENTERS.c_base and not context.other_card.debuffed then
        return {
          message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
          colour = G.C.XMULT,
          Xmult_mod = card.ability.extra.Xmult
        }
      end
    elseif context.joker_main and card.ability.extra.Xmult > 1.0 then
      return {
        message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
        colour = G.C.XMULT,
        Xmult_mod = card.ability.extra.Xmult
      }
    end
  end
}
-- Alolan Vulpix
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
-- Alolan Ninetales
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
        list = {a_vulpix, a_ninetales, shaymin_land, shaymin_sky,},
}