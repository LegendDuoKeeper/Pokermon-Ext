-- Munna 517
local munna={
  name = "munna", 
  poke_custom_prefix = "poke_ext",
  pos = {x = 9, y = 1},
  config = {extra = {odds = 4}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = G.P_CENTERS.c_poke_moonstone
    info_queue[#info_queue+1] = {set = 'Other', key = 'poke_ext_sleep_seal'}
    return {vars = {G.GAME and G.GAME.probabilities.normal or 1, center.ability.extra.odds}}
  end,
  rarity = 1, 
  cost = 5,
  experiment = true,
  item_req = "moonstone",
  stage = "Basic", 
  ptype = "Psychic",
  atlas = "Pokedex5",
  perishable_compat = false,
  eternal_compat = true,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint and (context.blind == G.P_BLINDS.bl_small or context.blind == G.P_BLINDS.bl_big) then
      local targets = {}
      for k, v in ipairs(G.playing_cards) do
        if v.seal == nil then
          table.insert(targets, v)
        end
      end
      if next(targets) ~= nil then
        local target = pseudorandom_element(targets, pseudoseed('munna_sleep'))
        target:set_seal('poke_ext_sleep', true)
        return {
          message = "Hypnosis!",
          colour = G.C.PINK,
        }
      end
    end
    if context.individual and context.cardarea == G.play then
      if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        if not context.other_card.debuff and pseudorandom('munna') < G.GAME.probabilities.normal/card.ability.extra.odds then
          if context.other_card.seal == 'poke_ext_sleep' or 
            context.other_card.seal == 'poke_ext_burned' or 
            context.other_card.seal == 'poke_ext_poison' or 
            context.other_card.seal == 'poke_ext_para' or 
            context.other_card.seal == 'poke_ext_frozen' then
              local _card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil)
              _card:add_to_deck()
              G.consumeables:emplace(_card)
              card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
          end
        end
      end 
    end
    return item_evo(self, card, context, "j_poke_ext_musharna")
  end
}
-- Musharna 518
local musharna={
  name = "musharna", 
  pos = {x = 10, y = 1},
  config = {extra = {retriggers = 1}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = G.P_CENTERS.c_poke_ext_dream_mist
    return {vars = {}}
  end,
  rarity = "poke_safari", 
  cost = 5,
  experiment = true,
  stage = "One", 
  ptype = "Psychic",
  atlas = "Pokedex5",
  perishable_compat = false,
  eternal_compat = true,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.setting_blind then 
      if context.blind == G.P_BLINDS.bl_small or context.blind == G.P_BLINDS.bl_big then
        if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
          local _card = create_card('Item', G.consumeables, nil, nil, nil, nil, 'c_poke_ext_dream_mist')
          _card:add_to_deck()
          G.consumeables:emplace(_card)
          card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('poke_plus_pokeitem'), colour = G.ARGS.LOC_COLOURS.item})
          return {
          message = "Dream Eater!",
          colour = G.C.PINK,
        }
        end
      end
    end
    if context.repetition and context.cardarea == G.play then
      if context.other_card.seal == 'poke_ext_sleep' or 
        context.other_card.seal == 'poke_ext_burned' or 
        context.other_card.seal == 'poke_ext_poison' or 
        context.other_card.seal == 'poke_ext_para' or 
        context.other_card.seal == 'poke_ext_frozen' then
          return {
            message = "Sleep Talk!",
            colour = G.C.PINK,
            repetitions = card.ability.extra.retriggers,
            card = card
          }
      end
    end
  end
}
-- Mareanie 747
local mareanie={
  name = "mareanie", 
  pos = {x = 3, y = 2},
  config = {extra = {chips = 35, rounds = 4}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = {set = 'Other', key = 'poke_ext_poison_seal',}
    return {vars = {center.ability.extra.chips, center.ability.extra.rounds}}
  end,
  rarity = 1, 
  cost = 4,
  experiment = true,
  stage = "Basic", 
  ptype = "Dark",
  atlas = "Pokedex7",
  perishable_compat = false,
  eternal_compat = true,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.first_hand_drawn and not context.repetition and not context.blueprint then
    local targets = {}
      for k, v in ipairs(G.hand.cards) do
        if v.seal == nil then
          table.insert(targets, v)
        end
      end
      if next(targets) ~= nil then
        local target = pseudorandom_element(targets, pseudoseed('mareanie_poison'))
        target:set_seal('poke_ext_poison', true)
        return {
          message = "Poisoned!",
          colour = G.C.PURPLE,
        }
      end
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card.seal == 'poke_ext_sleep' or 
      context.other_card.seal == 'poke_ext_burned' or 
      context.other_card.seal == 'poke_ext_poison' or 
      context.other_card.seal == 'poke_ext_para' or 
      context.other_card.seal == 'poke_ext_frozen' then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, 
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips
        }
      end
    end
      return level_evo(self, card, context, "j_poke_ext_toxapex")
  end
}
-- Toxapex 748
local toxapex={
name = "toxapex", 
pos = {x = 4, y = 2},
config = {extra = {chips = 80}},
loc_vars = function(self, info_queue, center)
  type_tooltip(self, info_queue, center)
  info_queue[#info_queue+1] = {set = 'Other', key = 'poke_ext_poison_seal',}
  return {vars = {center.ability.extra.chips}}
end,
rarity = "poke_safari", 
cost = 7,
experiment = true,
stage = "One", 
ptype = "Dark",
atlas = "Pokedex7",
perishable_compat = false,
eternal_compat = true,
blueprint_compat = true,
calculate = function(self, card, context)
  if context.first_hand_drawn and not context.blueprint then
    local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
    juice_card_until(card, eval, true)
  end
  if context.before and context.cardarea == G.jokers and not context.blueprint then
    if G.GAME.current_round.hands_played == 0 then
      local card = context.scoring_hand[1]
      if card.seal == nil then
        G.E_MANAGER:add_event(Event({
          func = function()
            if G.playing_cards then
              card:set_seal('poke_ext_poison', true)
              return true
            end
          end
      })) 
       return {
          message = "Bunker!",
          colour = G.C.PURPLE,
        }
      end
    end
  end
  if context.individual and context.cardarea == G.play then
    if context.other_card.seal == 'poke_ext_sleep' or 
      context.other_card.seal == 'poke_ext_burned' or 
      context.other_card.seal == 'poke_ext_poison' or 
      context.other_card.seal == 'poke_ext_para' or 
      context.other_card.seal == 'poke_ext_frozen' then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, 
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips
      }
    end
  end
end
}
-- Sizzlipede 850
local sizzlipede={
  name = "sizzlipede", 
  pos = {x = 1, y = 3},
  config = {extra = {mult = 4, rounds = 4}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = {key = 'poke_ext_burned_seal', set = 'Other'}
    return {vars = {center.ability.extra.mult, center.ability.extra.rounds}}
  end,
  rarity = 1, 
  cost = 5,
  experiment = true,
  stage = "Basic", 
  ptype = "Fire",
  atlas = "Pokedex8",
  perishable_compat = false,
  eternal_compat = true,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.first_hand_drawn and not context.blueprint and not context.repetition then
      local targets = {}
      for k, v in ipairs(G.hand.cards) do
        if v.seal == nil then
          table.insert(targets, v)
        end
      end
      if next(targets) ~= nil then
        local target = pseudorandom_element(targets, pseudoseed('sizzlipede'))
        target:set_seal('poke_ext_burned', true)
        return {
          message = "Burned!",
          colour = G.C.MULT,
        }
      end
    end

    if context.individual and context.cardarea == G.play then
      if context.other_card.seal == 'poke_ext_sleep' or 
        context.other_card.seal == 'poke_ext_burned' or 
        context.other_card.seal == 'poke_ext_poison' or 
        context.other_card.seal == 'poke_ext_para' or 
        context.other_card.seal == 'poke_ext_frozen' then
          return {
            mult_mod = card.ability.extra.mult,
            card = card,
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}},
            colour = G.C.MULT,
        }
      end
    end

    return level_evo(self, card, context, "j_poke_ext_centiskorch")
  end
}
-- Centiskorch 851
local centiskorch={
  name = "centiskorch", 
  pos = {x = 2, y = 3},
  config = {extra = {mult = 10}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = {key = 'poke_ext_burned_seal', set = 'Other'}
    return {vars = {center.ability.extra.mult, center.ability.extra.rounds}}
  end,
  rarity = "poke_safari", 
  cost = 8,
  experiment = true,
  stage = "One", 
  ptype = "Fire",
  atlas = "Pokedex8",
  perishable_compat = false,
  eternal_compat = true,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.first_hand_drawn and not context.blueprint and not context.repetition then
      card.ability.extra.burn_triggered = nil
      card.ability.extra.burned_card = nil
      local eval = function() return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES and not card.ability.extra.remove_triggered end
      juice_card_until(card, eval, true)
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card.seal == 'poke_ext_sleep' or 
        context.other_card.seal == 'poke_ext_burned' or 
        context.other_card.seal == 'poke_ext_poison' or 
        context.other_card.seal == 'poke_ext_para' or 
        context.other_card.seal == 'poke_ext_frozen' then
          return {
            mult_mod = card.ability.extra.mult,
            card = card,
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}},
            colour = G.C.MULT,
          }
      end
    end
    if context.discard and not context.blueprint and G.GAME.current_round.discards_used == 0 and context.full_hand and #context.full_hand == 1 and card.ability.extra.burn_triggered == nil then
      if card.ability.extra.burned_card == nil then
        card.ability.extra.burned_card = context.full_hand[1]
      end
      if context.other_card == card.ability.extra.burned_card then
        local target = context.other_card
        if target.seal == nil then
          target:set_seal('poke_ext_burned', true)
          return {
            delay = 0.45,
            message = "Burned!",
            colour = G.C.MULT,
          }
        end
      end
    end
  end
}
-- Snom 872
local snom={
  name = "snom", 
  pos = {x = 9, y = 4},
  config = {extra = {Xmult = 0.5, Xmult_mod = 0.1, volatile = 'right'}, evo_rqmt = 2 },
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = {set = 'Other', key = 'poke_volatile_'..center.ability.extra.volatile}
    info_queue[#info_queue+1] = {key = 'poke_ext_frozen_seal', set = 'Other'}
    return {vars = {center.ability.extra.Xmult, center.ability.extra.Xmult_mod}}
  end,
  rarity = 1, 
  cost = 5,
  experiment = true,
  stage = "Basic", 
  ptype = "Water",
  atlas = "Pokedex8",
  perishable_compat = false,
  eternal_compat = true,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.after and volatile_active(self, card, card.ability.extra.volatile) then
      local targets = {}
      for k, v in ipairs(context.scoring_hand) do
        if v.seal == nil then
          table.insert(targets, v)
        end
      end
      if next(targets) ~= nil then
        local target = pseudorandom_element(targets, pseudoseed('snom_freeze'))
        target:set_seal('poke_ext_frozen', true)
        return {
          message = "Frozen!",
          colour = G.C.CHIPS,
        }
      end
    end
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        return {
          Xmult_mod = card.ability.extra.Xmult,
          message = "Powder Snow!",
          colour = G.C.XMULT,
        }
      end
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card.seal == 'poke_ext_sleep' or 
        context.other_card.seal == 'poke_ext_burned' or 
        context.other_card.seal == 'poke_ext_poison' or 
        context.other_card.seal == 'poke_ext_para' or 
        context.other_card.seal == 'poke_ext_frozen' then
          card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
      end
    end
    return scaling_evo(self, card, context, "j_poke_ext_frosmoth", card.ability.extra.Xmult, self.config.evo_rqmt)
  end,
  -- add_to_deck = function(self, card, from_debuff)
  --   G.hand:change_size(-card.ability.extra.h_size)
  -- end,
  -- remove_from_deck = function(self, card, from_debuff)
  --   G.hand:change_size(card.ability.extra.h_size)
  -- end
}
-- Frosmoth 873
local frosmoth={
  name = "frosmoth", 
  pos = {x = 10, y = 4},
  config = {extra = {Xmult = 2, Xmult_mod = 0.1, volatile = 'right'}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = {key = 'poke_ext_frozen_seal', set = 'Other'}
    return {vars = {center.ability.extra.Xmult, center.ability.extra.Xmult_mod}}
  end,
  rarity = "poke_safari", 
  cost = 8,
  experiment = true,
  stage = "One", 
  ptype = "Water",
  atlas = "Pokedex8",
  perishable_compat = false,
  eternal_compat = true,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.after and volatile_active(self, card, card.ability.extra.volatile) then
      local targets = {}
      for k, v in ipairs(context.scoring_hand) do
        if v.seal == nil then
          table.insert(targets, v)
        end
      end
      if next(targets) ~= nil then
        local target = pseudorandom_element(targets, pseudoseed('snom_freeze'))
        target:set_seal('poke_ext_frozen', true)
        return {
          message = "Frozen!",
          colour = G.C.CHIPS,
        }
      end
    end
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        return {
          Xmult_mod = card.ability.extra.Xmult,
          message = "Blizzard!",
          colour = G.C.XMULT,
        }
      end
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card.seal == 'poke_ext_sleep' or 
        context.other_card.seal == 'poke_ext_burned' or 
        context.other_card.seal == 'poke_ext_poison' or 
        context.other_card.seal == 'poke_ext_para' or 
        context.other_card.seal == 'poke_ext_frozen' then
          card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
      end
    end
  end
}
-- Tadbulb 938
local tadbulb={
  name = "tadbulb", 
  pos = {x = 9, y = 2},
  config = {extra = {money = 2, total = 0, odds = 4, money_limit = 20, statuses = 0}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = G.P_CENTERS.c_poke_ext_magnet
    local statuses = 0
    if G.playing_cards then
      for k, v in pairs(G.playing_cards) do
        if
          v.seal == 'poke_ext_sleep' or
          v.seal == 'poke_ext_burned' or 
          v.seal == 'poke_ext_poison' or 
          v.seal == 'poke_ext_para' or 
          v.seal == 'poke_ext_frozen' 
        then
          statuses = statuses + 1
          center.ability.extra.statuses = statuses
        end
      end
      if center.ability.extra.statuses > 0 then
        center.ability.extra.total = center.ability.extra.money * (math.floor(center.ability.extra.statuses / 3))
      end
    end
    return {vars = {G.GAME and G.GAME.probabilities.normal or 1, center.ability.extra.money, center.ability.extra.total, center.ability.extra.odds, center.ability.extra.money_limit}}
  end,
  rarity = 1, 
  cost = 4,
  experiment = true,
  item_req = "thunderstone",
  stage = "Basic", 
  ptype = "Lightning",
  atlas = "Pokedex9",
  perishable_compat = false,
  eternal_compat = true,
  blueprint_compat = true,
  calculate = function(self, card, context)
    local targets = {}
    if context.after and not context.blueprint then
      if pseudorandom('tadbulb') < G.GAME.probabilities.normal/card.ability.extra.odds then
        for k, v in ipairs(G.hand.cards) do
          if v.seal == nil then
            table.insert(targets, v)
          end
        end
      end
      if next(targets) ~= nil then
        local target = pseudorandom_element(targets, pseudoseed('tadbulb_para'))
        target:set_seal('poke_ext_para', true)
        return {
          message = "Paralyzed!",
          colour = G.C.MONEY,
        }
      end
    end

    return item_evo(self, card, context, "j_poke_ext_bellibolt")
  end,
  calc_dollar_bonus = function(self, card)
    if card.ability.extra.statuses > 0 then
      local statuses = 0
      for k, v in pairs(G.playing_cards) do
        if
          v.seal == 'poke_ext_sleep' or
          v.seal == 'poke_ext_burned' or 
          v.seal == 'poke_ext_poison' or 
          v.seal == 'poke_ext_para' or 
          v.seal == 'poke_ext_frozen' 
        then
          statuses = statuses + 1
          card.ability.extra.statuses = statuses
        end
      end
      card.ability.extra.total = card.ability.extra.money * (math.floor(card.ability.extra.statuses / 3))
    end
    if card.ability.extra.total > 0 then
      return ease_poke_dollars(card, "tadbulb", math.min(card.ability.extra.money_limit, card.ability.extra.total), true)
    end
  end
}
-- Bellibolt 939
local bellibolt={
  name = "bellibolt", 
  pos = {x = 10, y = 2},
  config = {extra = {money = 3, total = 0, odds = 3, money_limit = 20, statuses = 0}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = G.P_CENTERS.c_poke_ext_magnet
    local statuses = 0
    if G.playing_cards then
      for k, v in pairs(G.playing_cards) do
        if
          v.seal == 'poke_ext_sleep' or
          v.seal == 'poke_ext_burned' or 
          v.seal == 'poke_ext_poison' or 
          v.seal == 'poke_ext_para' or 
          v.seal == 'poke_ext_frozen' 
        then
          statuses = statuses + 1
          center.ability.extra.statuses = statuses
        end
      end
      if center.ability.extra.statuses > 0 then
        center.ability.extra.total = center.ability.extra.money * (math.floor(center.ability.extra.statuses / 4))
      end
    end
    return {vars = {G.GAME and G.GAME.probabilities.normal or 1, center.ability.extra.money, center.ability.extra.total, center.ability.extra.odds, center.ability.extra.money_limit}}
  end,
  rarity = "poke_safari", 
  cost = 8,
  experiment = true,
  stage = "One", 
  ptype = "Lightning",
  atlas = "Pokedex9",
  perishable_compat = false,
  eternal_compat = true,
  blueprint_compat = true,
  calculate = function(self, card, context)
    local targets = {}
    if context.after and not context.blueprint then
      if pseudorandom('bellibolt') < G.GAME.probabilities.normal/card.ability.extra.odds then
        for k, v in ipairs(G.hand.cards) do
          if v.seal == nil then
            table.insert(targets, v)
          end
        end
      end
      if next(targets) ~= nil then
        local target = pseudorandom_element(targets, pseudoseed('bellibolt_para'))
        target:set_seal('poke_ext_para', true)
        return {
          message = "Paralyzed!",
          colour = G.C.MONEY,
        }
      end
    end
  end,
  calc_dollar_bonus = function(self, card)
    if card.ability.extra.statuses > 0 then
      local statuses = 0
      for k, v in pairs(G.playing_cards) do
        if
          v.seal == 'poke_ext_sleep' or
          v.seal == 'poke_ext_burned' or 
          v.seal == 'poke_ext_poison' or 
          v.seal == 'poke_ext_para' or 
          v.seal == 'poke_ext_frozen' 
        then
          statuses = statuses + 1
          card.ability.extra.statuses = statuses
        end
      end
      card.ability.extra.total = card.ability.extra.money * (math.floor(card.ability.extra.statuses / 2))
    end
    if card.ability.extra.total > 0 then
      return ease_poke_dollars(card, "bellibolt", math.min(card.ability.extra.money_limit, card.ability.extra.total), true)
    end
  end
}
-- Sneasel-H 215
local sneaselh={
  name = "sneaselh", 
  pos = {x = 6, y = 4},
  config = {extra = {mult_mod = 2, mult = 0, poisoned = 0}},
  loc_vars = function(self, info_queue, center)
    info_queue[#info_queue+1] = G.P_CENTERS.c_poke_sunstone
    info_queue[#info_queue+1] = {set = 'Other', key = 'poke_ext_poison_seal',}
    type_tooltip(self, info_queue, center)
      local poisoned = 0
        if G.playing_cards then
          for k, v in pairs(G.playing_cards) do
            if
              v.seal == 'poke_ext_poison'
            then
              poisoned = poisoned + 1
              center.ability.extra.poisoned = poisoned
            end
          end
          if center.ability.extra.poisoned > 0 then
            center.ability.extra.mult = center.ability.extra.mult_mod * center.ability.extra.poisoned
          end
        end
    return {vars = {center.ability.extra.mult_mod, center.ability.extra.mult, center.ability.extra.poisoned}}
  end,
  rarity = 1, 
  cost = 4,
  experiment = true,
  item_req = "sunstone",
  stage = "Basic", 
  ptype = "Fighting",
  atlas = "Regionals",
  perishable_compat = false,
  eternal_compat = true,
  blueprint_compat = true,
  calculate = function(self, card, context)
    -- Brace for Spaghetti Batman
    local first_rank = nil
    local second_rank = nil
    local third_rank = nil
    local first_rank_played = 0
    local second_rank_played = 0
    local third_rank_played = 0
    local trigger = false
    if context.before and not context.repetition then
      local poisoned = 0
        if G.playing_cards then
          for k, v in pairs(G.playing_cards) do
            if
              v.seal == 'poke_ext_poison'
            then
              poisoned = poisoned + 1
              card.ability.extra.poisoned = poisoned
            end
          end
          if card.ability.extra.poisoned > 0 then
            card.ability.extra.mult = card.ability.extra.mult_mod * card.ability.extra.poisoned
          end
        end
        --
        for k, v in pairs(context.scoring_hand) do
          if not first_rank and v:get_id() > 0 then
            first_rank = v:get_id()
          elseif not second_rank and v:get_id() > 0 and v:get_id() ~= first_rank then
            second_rank = v:get_id()
          elseif not third_rank and v:get_id() > 0 and v:get_id() ~= first_rank and v:get_id() ~= second_rank then
            third_rank = v:get_id()
          end
        end
        --
          for k, v in pairs(context.scoring_hand) do
            if first_rank and v:get_id() == first_rank then
              first_rank_played = first_rank_played + 1
            elseif second_rank and v:get_id() == second_rank then
              second_rank_played = second_rank_played + 1
            elseif third_rank and v:get_id() == third_rank then
              third_rank_played = third_rank_played + 1
            end
          end
        --
        if context.cardarea == G.jokers and G.GAME.current_round.hands_played == 0 then
          if first_rank_played then
            if first_rank_played == 3 then
              trigger = true
            end
          end
          if second_rank_played then
            if second_rank_played == 3 then
              trigger = true
            end
          end
          if third_rank_played then
            if third_rank_played == 3 then
              trigger = true
            end
          end
          --
          if trigger == true then
            local targets = {}
            for k, v in ipairs(context.scoring_hand) do
                if v.seal == nil then
                table.insert(targets, v)
                end
            end
            if next(targets) ~= nil then
                local target = pseudorandom_element(targets, pseudoseed('sneaselh_poison'))
                target:set_seal('poke_ext_poison', true)
                return {
                  message = "Poisoned!",
                  colour = G.C.PURPLE,
                }
            end
          end
        end
    end
    if context.cardarea == G.jokers and context.scoring_hand then
        if context.joker_main then
          return {
            mult_mod = card.ability.extra.mult,
            message = "Poison Jab!",
            colour = G.C.PURPLE,
          }
        end
    end
      return item_evo(self, card, context, "j_poke_ext_sneasler")
  end
}
-- Sneasler 903
  local sneasler={
  name = "sneasler", 
  pos = {x = 6, y = 8},
  config = {extra = {mult_mod = 2, mult = 0, sneaslered = 0}},
  loc_vars = function(self, info_queue, center)
    info_queue[#info_queue+1] = {set = 'Other', key = 'poke_ext_poison_seal',}
    info_queue[#info_queue+1] = G.P_CENTERS.c_poke_ext_magnet
    info_queue[#info_queue+1] = {set = 'Other', key = 'poke_ext_sleep_seal'}
    type_tooltip(self, info_queue, center)
    local sneaslered = 0
        if G.playing_cards then
          for k, v in pairs(G.playing_cards) do
            if
              v.seal == 'poke_ext_sleep' or
              v.seal == 'poke_ext_poison' or 
              v.seal == 'poke_ext_para'
            then
              sneaslered = sneaslered + 1
              center.ability.extra.sneaslered = sneaslered
            end
          end
          if center.ability.extra.sneaslered > 0 then
            center.ability.extra.mult = center.ability.extra.mult_mod * center.ability.extra.sneaslered
          end
        end
    return {vars = {center.ability.extra.mult_mod, center.ability.extra.mult}}
  end,
  rarity = "poke_safari", 
  cost = 7,
  experiment = true,
  stage = "One", 
  ptype = "Fighting",
  atlas = "Pokedex8",
  perishable_compat = false,
  eternal_compat = true,
  blueprint_compat = true,
  calculate = function(self, card, context)
      -- Brace for Spaghetti Batman
    local first_rank = nil
    local second_rank = nil
    local third_rank = nil
    local first_rank_played = 0
    local second_rank_played = 0
    local third_rank_played = 0
    local trigger = nil
    if context.before and not context.repetition then
      local sneaslered = 0
        if G.playing_cards then
          for k, v in pairs(G.playing_cards) do
            if
              v.seal == 'poke_ext_sleep' or
              v.seal == 'poke_ext_poison' or 
              v.seal == 'poke_ext_para'
            then
              sneaslered = sneaslered + 1
              card.ability.extra.sneaslered = sneaslered
            end
          end
          if card.ability.extra.sneaslered > 0 then
            card.ability.extra.mult = card.ability.extra.mult_mod * card.ability.extra.sneaslered
          end
        end
        --
        for k, v in pairs(context.scoring_hand) do
          if not first_rank and v:get_id() > 0 then
            first_rank = v:get_id()
          elseif not second_rank and v:get_id() > 0 and v:get_id() ~= first_rank then
            second_rank = v:get_id()
          elseif not third_rank and v:get_id() > 0 and v:get_id() ~= first_rank and v:get_id() ~= second_rank then
            third_rank = v:get_id()
          end
        end
        --
          for k, v in pairs(context.scoring_hand) do
            if first_rank and v:get_id() == first_rank then
              first_rank_played = first_rank_played + 1
            elseif second_rank and v:get_id() == second_rank then
              second_rank_played = second_rank_played + 1
            elseif third_rank and v:get_id() == third_rank then
              third_rank_played = third_rank_played + 1
            end
          end
        --
        if context.cardarea == G.jokers and G.GAME.current_round.hands_played == 0 then
          if first_rank_played then
            if first_rank_played == 3 then
              trigger = 1
            end
          end
          if second_rank_played then
            if second_rank_played == 3 then
              trigger = 2
            end
          end
          if third_rank_played then
            if third_rank_played == 3 then
              trigger = 3
            end
          end
          --
          if trigger ~= nil then
            local target_rank = nil
            local next_status = 0
            local targets = {}
            if trigger == 1 then
              target_rank = first_rank
            elseif trigger == 2 then
              target_rank = second_rank
            elseif trigger == 3 then
              target_rank = third_rank
            end
            for k, v in ipairs(context.scoring_hand) do
              if v:get_id() == target_rank then
                table.insert(targets, v)
              end
            end
            for k, v in pairs(targets) do 
              if next_status == 0 then
                next_status = next_status + 1
                if v.seal == nil then
                  v:set_seal("poke_ext_poison", true)
                end
              elseif next_status == 1 then 
                next_status = next_status + 1
                if v.seal == nil then 
                  v:set_seal("poke_ext_para", true)
                end
              elseif next_status == 2 then
                if v.seal == nil then
                  v:set_seal("poke_ext_sleep", true)
                end
              end
            end
            return {
                  message = "Statused!",
                  colour = G.C.PURPLE,
                }
          end
        end
    end
    if context.cardarea == G.jokers and context.scoring_hand then
        if context.joker_main then
          return {
            mult_mod = card.ability.extra.mult,
            message = "Dire Claw!",
            colour = G.C.PURPLE,
          }
        end
    end
  end
}


  return {name = "Various Additional Jokers",
  list = {munna, musharna, mareanie, toxapex, sizzlipede, centiskorch, snom, frosmoth, tadbulb, bellibolt, 
  sneaselh, sneasler,
},
}