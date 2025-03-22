-- Petilil 548
local petilil={
  name = "petilil", 
  poke_custom_prefix = "poke_ext",
  pos = {x = 12, y = 3},
  config = {extra = {chips = 5, mult = 1, money = 2, suit = "Spades"}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = G.P_CENTERS.c_poke_sunstone
    return {vars = {center.ability.extra.money, center.ability.extra.chips, center.ability.extra.mult}}
  end,
  rarity = 1, 
  cost = 5,
  item_req = "sunstone",
  stage = "Basic", 
  ptype = "Grass",
  atlas = "Pokedex5",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and not context.other_card.debuff and context.other_card:is_suit(card.ability.extra.suit) then
      if not context.end_of_round and not context.before and not context.after and not context.other_card.debuff and G.GAME.current_round.hands_left == 0 then
          return {
            chips = card.ability.extra.chips,
            mult = card.ability.extra.mult,
            card = card
          }
      end
    end
    return item_evo(self, card, context, "j_poke_ext_lilligant")
  end, 
  calc_dollar_bonus = function(self, card)
    if G.GAME.current_round.hands_left == 0 then
      return ease_poke_dollars(card, "petilil", card.ability.extra.money, true)
    end
  end
}
-- Lilligant 549
local lilligant={
  name = "lilligant", 
  pos = {x = 13, y = 3},
  config = {extra = {
    Xmult = 2.0, 
    Xmult_mod = 0.3, 
    Xmult_modminus = 0.2, 
    suit = "Spades", 
    current_spade_count = 0
  }},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {
            center.ability.extra.Xmult,
            center.ability.extra.Xmult_mod,
            center.ability.extra.Xmult_modminus,
            center.ability.extra.current_spade_count,
    }}
  end,
  rarity = "poke_safari", 
  cost = 5, 
  stage = "One", 
  ptype = "Grass",
  atlas = "Pokedex5",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.joker_main then
      if card.ability.extra.Xmult > 1.0 then
        return {
          message = 'Petal Dance!',
          colour = G.C.XMULT,
          mult_mod = card.ability.extra.mult,
          Xmult_mod = card.ability.extra.Xmult
        }
      elseif card.ability.extra.Xmult <= 1.0 then
        G.E_MANAGER:add_event(Event({
          func = function()
            play_sound('tarot1')
            card.T.r = -0.2
            card:juice_up(0.3, 0.4)
            card.states.drag.is = true
            card.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
              func = function()
                G.jokers:remove_card(card)
                card:remove()
                card = nil
                return true; end})) 
            return true
          end
        }))
        if context.cardarea == G.jokers then
          return {
            message = "WILTED!",
            card = card 
          }
        end
      end
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit(card.ability.extra.suit) then
              card.ability.extra.current_spade_count = card.ability.extra.current_spade_count + 1
      else
              card.ability.extra.Xmult = card.ability.extra.Xmult - card.ability.extra.Xmult_modminus
      end
      if card.ability.extra.current_spade_count >= 15 then
              card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
              card.ability.extra.current_spade_count = card.ability.extra.current_spade_count - 15
      end
    end
  end

}
-- Joltik 595
local joltik={
  name = "joltik",
  pos = {x = 3, y = 7},
  config = {extra = {money_minus = 1, rounds = 3, tarots = 0}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = {set = 'Other', key = 'poke_drain'}
    info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}}
    info_queue[#info_queue+1] = G.P_CENTERS.c_devil
    return {vars = {center.ability.extra.money_minus, center.ability.extra.rounds, center.ability.extra.tarots}}
  end,
  rarity = 2,
  cost = 8,
  stage = "Basic",
  ptype = "Lightning",
  atlas = "Pokedex5",
  perishable_compat = false,
  blueprint_compat = false,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.ending_shop and not context.individual and not context.repetition then
      local adjacent = poke_get_adjacent_jokers(card)
      for i = 1, #G.jokers.cards do 
        if G.jokers.cards[i] ~= card then
          poke_drain(card, G.jokers.cards[i], card.ability.extra.money_minus)
        end
      end
    end
    if context.post_trigger or context.ending_shop or context.end_of_round or context.using_consumeable then
      card.ability.extra.tarots = math.floor(card.sell_cost / 6)
    end
    local evo = level_evo(self, card, context, "j_poke_ext_galvantula")
    if evo and type(evo) == "table" then
      for i = 1, card.ability.extra.tarots do
        G.E_MANAGER:add_event(Event({
          func = (function()
            local _card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_devil')
            local edition = {negative = true}
            _card:set_edition(edition, true)
            _card:add_to_deck()
            G.consumeables:emplace(_card)
            return true
          end)
        }))
      end
    end
    return evo
  end,
}
-- Galvantula 596
local galvantula={
  name = "galvantula", 
  pos = {x = 4, y = 7},
  config = {extra = {mult = 0, mult_mod = 6, money = 0, money_mod = 1, money_limit = 25}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.mult, card.ability.extra.mult_mod, card.ability.extra.money, card.ability.extra.money_mod, card.ability.extra.money_limit}}
  end,
  rarity = "poke_safari", 
  cost = 8, 
  stage = "One", 
  ptype = "Lightning",
  atlas = "Pokedex5",
  perishable_compat = false,
  blueprint_compat = true,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before and not context.blueprint then
      for k, v in ipairs(context.scoring_hand) do
        if v.config.center == G.P_CENTERS.m_gold and not v.debuff then 
          v.vampired = true
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod 
            card.ability.extra.money = math.min((card.ability.extra.money + card.ability.extra.money_mod), card.ability.extra.money_limit)
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
    end
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        return {
          message = "Discharge!",
          colour = G.C.BLACK,
          mult = card.ability.extra.mult
        }
      end
    end
  end,
  calc_dollar_bonus = function(self, card)
    return ease_poke_dollars(card, "galvantula", math.min(card.ability.extra.money_limit, card.ability.extra.money), true) 
  end
}
-- Carbink 703
local carbink={
  name = "carbink", 
  no_pool_flag="carbanana_mutate",
  pos = {x = 11, y = 3},
  config = {extra = {diamonds = 0, odds = 250, percent = 0, delete = false, rolled = false}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    local diamonds = 0
    if G.playing_cards then
      for k, v in pairs(G.playing_cards) do
        if v:is_suit("Diamonds") then
          diamonds = diamonds + 1
          center.ability.extra.diamonds = diamonds
        end
      end
      if center.ability.extra.diamonds > 0 then
        center.ability.extra.percent = math.min((math.floor(center.ability.extra.diamonds / center.ability.extra.odds * 10000)) / 100, 100)
      end
    end
    info_queue[#info_queue+1] = {key = 'percent_chance', set = 'Other', specific_vars = {center.ability.extra.percent}}
    return {vars = {1, center.ability.extra.odds}}
  end,
  rarity = 1, 
  cost = 6, 
  stage = "Basic", 
  ptype = "Earth",
  atlas = "Pokedex6",
  blueprint_compat = false,
  calculate = function(self, card, context)
    if context.first_hand_drawn and not context.blueprint then
      local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
      juice_card_until(card, eval, true)
    end
    if context.before and context.cardarea == G.jokers and not context.blueprint then
      if G.GAME.current_round.hands_played == 0 then
        local card = context.scoring_hand[1]
        G.E_MANAGER:add_event(Event({
            func = function()
              if G.playing_cards then
                SMODS.change_base(context.scoring_hand[1], "Diamonds")   
                return true
              end
            end
        })) 
      end
    end
    if context.end_of_round and card.ability.extra.rolled == false then
      card.ability.extra.rolled = true
      local diamonds = 0
      for k,v in ipairs(G.playing_cards) do
          if v:is_suit("Diamonds") then
              diamonds = diamonds + 1
              card.ability.extra.diamonds = diamonds
          end
      end
        local mutate_chance = (card.ability.extra.diamonds / card.ability.extra.odds)
        local carbrandom = (pseudorandom("carbanana"))
        card.ability.extra.delete = false
        if carbrandom < mutate_chance then
          card.ability.extra.delete = true
          G.GAME.pool_flags.carbanana_mutate = true
          G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('tarot1')
                card.T.r = -0.2
                card:juice_up(0.3, 0.4)
                card.states.drag.is = true
                card.children.center.pinch.x = true
                -- This part destroys the card.
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.3,
                    blockable = false,
                    func = function()
                        G.jokers:remove_card(card)
                        card:remove()
                        card = nil
                        return true;
                    end
                }))
                return true
            end
          }))
          if context.cardarea == G.jokers then
          return {
            message = "MUTATE!",
            colour = G.C.CHIPS,
            card = card 
          }
          end
        end
    end
    if context.setting_blind then
      card.ability.extra.rolled = false
    end
  end

}
-- Diancie 719
local diancie={
  name = "diancie", 
  yes_pool_flag="carbanana_mutate",
  pos = {x = 0, y = 6},
  soul_pos = { x = 1, y = 6},
  config = {extra = {mult = 5, retriggers = 1, suit = "Diamonds"}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = {set = 'Other', key = 'mega_poke'}
                return {vars = {center.ability.extra.mult}}
  end,
  rarity = 3, 
  cost = 9, 
  stage = "Legendary", 
  ptype = "Earth",
  atlas = "Pokedex6",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and not context.other_card.debuff and context.other_card:is_suit(card.ability.extra.suit) then
      if not context.end_of_round and not context.before and not context.after and not context.other_card.debuff then
          return {
            mult = card.ability.extra.mult,
            card = card
          }
      end
    end
    if context.repetition and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
      if not context.end_of_round and not context.before and not context.after and not context.other_card.debuff then
        return {
          message = 'STORM!',
            repetitions = card.ability.extra.retriggers,
            card = card
        }
      end
    end
  end,
  megas = {"mega_diancie"}
}
-- Diancie-Mega
local mega_diancie={
  name = "mega_diancie", 

  pos = {x = 8, y = 6},
  soul_pos = {x = 9, y = 6},
  config = {extra = {Xmult_multi = 1.2, money_mod = 1, retriggers = 1, rounds = 1, suit = "Diamonds"}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
                return {vars = {center.ability.extra.Xmult_multi, center.ability.extra.money_mod}}
  end,
  rarity = "poke_mega", 
  cost = 16, 
  stage = "Mega", 
  ptype = "Earth",
  atlas = "Megas",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and not context.other_card.debuff then
      if not context.end_of_round and not context.before and not context.after and not context.other_card.debuff then
        local earned = ease_poke_dollars(card, "mega_diancie", card.ability.extra.money_mod, true)
          return {
            x_mult = card.ability.extra.Xmult_multi,
            dollars = earned,
            card = card
          }
      end
    end
    if context.repetition and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
      if not context.end_of_round and not context.before and not context.after and not context.other_card.debuff then
        return {
          message = 'STORM!',
            repetitions = card.ability.extra.retriggers,
            card = card
        }
      end
    end
  end
}
-- Rockruff 744
local rockruff={
  name = "rockruff", 
  pos = {x = 11, y = 1},
  config = {extra = {mult = 3, rounds = 4, clubs = 0, suit = "Clubs"}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      local clubs = 0
      if G.playing_cards then
        for k, v in pairs(G.playing_cards) do
          if v:is_suit("Clubs") then
            clubs = clubs + 1
            center.ability.extra.clubs = clubs
          end
        end
      end
    return {vars = {center.ability.extra.mult, center.ability.extra.rounds, center.ability.extra.clubs, localize(center.ability.extra.suit, 'suits_singular')}}
  end,
  rarity = 1, 
  cost = 4, 
  stage = "Basic", 
  ptype = "Earth",
  atlas = "Pokedex7",
  blueprint_compat = true,
  perishable_compat = false,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and not context.other_card.debuff then
      if context.other_card:is_suit(card.ability.extra.suit) then
        return {
            mult = card.ability.extra.mult,
            card = card
        }
      end
    end
    if context.end_of_round then
      local clubs = 0
      for k,v in ipairs(G.playing_cards) do
          if v:is_suit("Clubs") then
              clubs = clubs + 1
              card.ability.extra.clubs = clubs
          end
      end
      if clubs < 20 then
        return level_evo(self, card, context, "j_poke_ext_lycanroc")
      elseif clubs >= 20 and clubs <= 30 then
        return level_evo(self, card, context, "j_poke_ext_lycanrocn")
      elseif clubs > 30 then
        return level_evo(self, card, context, "j_poke_ext_lycanrocd")
      end
    end
  end

}
-- Lycanroc 745
local lycanroc={
  name = "lycanroc", 
  pos = {x = 12, y = 1},
  config = {extra = {suit = "Clubs", odds = 2, club_count = 0}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {G.GAME and G.GAME.probabilities.normal or 1, center.ability.extra.odds}}
  end,
  rarity = "poke_safari", 
  cost = 8, 
  stage = "One", 
  ptype = "Earth",
  atlas = "Pokedex7",
  blueprint_compat = true,
  perishable_compat = false,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.before then
      card.ability.extra.club_count = 0 
      for i = 1, #context.scoring_hand do
        if context.scoring_hand[i]:is_suit(card.ability.extra.suit) then
          card.ability.extra.club_count = card.ability.extra.club_count + 1
        end
      end
      --if G.GAME.current_round.hands_played == 0 then     (Old first hand of round clause)
        if card.ability.extra.club_count > 1 then
          if pseudorandom('lycanroc') < G.GAME.probabilities.normal/card.ability.extra.odds then
            local targets = {}
            for k, v in ipairs(context.scoring_hand) do
              if v:is_suit("Clubs") then
                table.insert(targets, v)
              end
            end
            if card.ability.extra.club_count > 1 then 
              card.ability.extra.club_count = 0
              local target = pseudorandom_element(targets, pseudoseed('lycanroc_copy'))
              local copy = copy_card(target, nil, nil, G.playing_card)
              copy:add_to_deck()
              G.deck.config.card_limit = G.deck.config.card_limit + 1
              table.insert(G.playing_cards, copy)
              -- If you want it to not place the duplicated card into the hand after duping and put it into the deck instead,
              -- in line 206, change from G.hand:emplace(copy) to G.deck:emplace(copy)
              G.hand:emplace(copy)
              copy.states.visible = nil
              G.E_MANAGER:add_event(Event({
                func = function()
                copy:start_materialize()
                return true
              end
              }))
              playing_card_joker_effects({copy})
              return {
                  message = localize('k_copied_ex'),
                  colour = G.C.CHIPS,
                  card = card,
                  playing_cards_created = {true}
              }
            end
          end
          card.ability.extra.club_count = 0
        end
      --end (Matching end for above clause)
    end
  end
}
-- Lycanroc-Night 745
local lycanrocn={
  name = "lycanrocn", 
  pos = {x = 13, y = 1},
  config = {extra = {Xmult = 1, Xmult_mod = 0.05, suit = "Clubs"}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.Xmult, center.ability.extra.Xmult_mod}}
  end,
  rarity = "poke_safari", 
  cost = 8, 
  stage = "One", 
  ptype = "Earth",
  atlas = "Pokedex7",
  blueprint_compat = true,
  perishable_compat = false,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before and not context.blueprint then
      for k, v in ipairs(context.scoring_hand) do
        if v:is_suit("Clubs") then
          card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
        end
      end
    end
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        return {
          Xmult = card.ability.extra.Xmult
        }
      end
    end
  end

}
-- Lycanroc-Dusk 745
local lycanrocd={
  name = "lycanrocd", 
  pos = {x = 0, y = 2},
  config = {extra = {Xmult_multi = 1.25}},
    loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      return {vars = {center.ability.extra.Xmult_multi}}
  end,
  rarity = "poke_safari", 
  cost = 12, 
  stage = "One", 
  ptype = "Earth",
  atlas = "Pokedex7",
  blueprint_compat = true,
  perishable_compat = false,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and not context.other_card.debuff then
      if context.other_card:is_suit("Clubs") then
        return {
          x_mult = card.ability.extra.Xmult_multi,
          card = card
        }
      end
    end
  end
}
-- Fomantis 753
local fomantis={
  name = "fomantis",
  pos = {x = 9, y = 2},
  config = {extra = {card_threshold = 12, cards_scored = 0, rounds = 4, }},
   loc_vars = function(self, info_queue, center)
     type_tooltip(self, info_queue, center)
     info_queue[#info_queue+1] = G.P_CENTERS.c_sun
     info_queue[#info_queue+1] = G.P_CENTERS.c_poke_sunstone
     return {vars = {center.ability.extra.card_threshold, center.ability.extra.cards_scored, center.ability.extra.rounds}}
   end,
   rarity = 2,
   cost = 7,
   item_req = "sunstone",
   stage = "Basic",
   ptype = "Grass",
   atlas = "Pokedex7",
   blueprint_compat = false,
   perishable_compat = false,
   eternal_compat = true,
   calculate = function(self, card, context)
     if context.before then
         for _, cards in ipairs(context.scoring_hand) do
             if cards:is_suit("Hearts", true) then
                 card.ability.extra.cards_scored = card.ability.extra.cards_scored + 1 
             end
         end
         if card.ability.extra.cards_scored > card.ability.extra.card_threshold then
             card.ability.extra.cards_scored = 12
         end
     end
     if context.end_of_round and not context.individual and not context.repetition then
      if card.ability.extra.rounds > 0 then
         if card.ability.extra.cards_scored == card.ability.extra.card_threshold then
             card.ability.extra.cards_scored = 0
             local _card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_sun')
             _card:add_to_deck()
             G.consumeables:emplace(_card)
         end
         if card.ability.extra.rounds > 0 then
             card.ability.extra.rounds = card.ability.extra.rounds - 1
         end
        end
     end
     return item_evo(self, card, context, "j_poke_ext_lurantis")
   end,
 }
-- Lurantis 754
local lurantis={
name = "lurantis",
pos = {x = 10, y = 2},
config = {extra = {Xmult = 1, Xmult_mod = 0.15}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = { center.ability.extra.Xmult, center.ability.extra.Xmult_mod }}
  end,
  rarity = "poke_safari",
  cost = 9,
  stage = "One",
  ptype = "Grass",
  atlas = "Pokedex7",
  blueprint_compat = true,
  perishable_compat = false,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.after then
      local _card = context.scoring_hand[1]
      if _card:is_suit('Hearts') and context.cardarea == G.jokers then
        if _card.config.center ~= G.P_CENTERS.c_base and not _card.debuff then
          card.ability.extra.Xmult = card.ability.extra.Xmult + (card.ability.extra.Xmult_mod * 2)
          G.E_MANAGER:add_event(Event{
            trigger = 'after',
            delay = 0.3,
            func = function()
              _card:start_dissolve({G.C.RED}, nil, 1.6)
              return true end
          })
        else
          card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
          G.E_MANAGER:add_event(Event{
            trigger = 'after',
            delay = 0.3,
            func = function()
              _card:start_dissolve({G.C.RED}, nil, 1.6)
              return true end
          })
        end
      end
    end
    if context.joker_main then
      return {
        Xmult = card.ability.extra.Xmult,
        message = 'SOLARBLADE!'
      }
    end
    if context.remove_playing_cards then
      for k, val in ipairs(context.removed) do
        if val:is_suit("Hearts") then
          if val.config.center ~= G.P_CENTERS.c_base and not val.debuff then
            card.ability.extra.Xmult = card.ability.extra.Xmult + (card.ability.extra.Xmult_mod * 2)
          else
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
          end
        end
      end
    end
  end
}
-- --Darkrai
-- local darkrai={
--   name = "darkrai",
--   no_pool_flag="darkrai_sold",
--   pos = {x = 8, y = 8},
--   soul_pos = { x = 9, y = 8},
--   config = {extra = {}},
--   loc_vars = function(self, info_queue, center)
--     type_tooltip(self, info_queue, center)
--     return {vars = {}}
--   end,
--   rarity = 4,
--   cost = 20,
--   stage = "Legendary",
--   ptype = "Dark",
--   atlas = "Pokedex4",
--   perishable_compat = false,
--   blueprint_compat = false,
--   eternal_compat = false,
--   calculate = function(self, card, context)
--     if context.selling_self then
--       if G.GAME.pool_flags.darkrai_sold == false then
--         G.GAME.pool_flags.darkrai_sold = true
--       end
--       if G.shop_vouchers and G.shop_vouchers.cards then 
--       local baddreams_in_shop = false
--         if not baddreams_in_shop then
--           for i = 1, #G.shop_vouchers.cards do
--             if G.shop_vouchers.cards[i].ability.name == "baddreams" then
--               baddreams_in_shop = true
--             end
--           end
--           if not G.GAME.used_vouchers.v_poke_ext_baddreams and not baddreams_in_shop then
--             G.shop_vouchers.config.card_limit = G.shop_vouchers.config.card_limit + 1
--             local _card = Card(G.shop_vouchers.T.x + G.shop_vouchers.T.w/2,
--             G.shop_vouchers.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS['v_poke_ext_baddreams'],{bypass_discovery_center = true, bypass_discovery_ui = true})
--             create_shop_card_ui(_card, 'Voucher', G.shop_vouchers)
--             _card:start_materialize()
--             G.shop_vouchers:emplace(_card)
--             added = true
--           end
--         end
--       end
--     end
--   end,
-- }

return {name = "Various Additional Jokers",
-- list = {petilil, lilligant, joltik, galvantula, carbink, diancie, mega_diancie, rockruff, lycanroc, lycanrocn, lycanrocd, fomantis, lurantis, darkrai,},
-- }

list = {petilil, lilligant, joltik, galvantula, carbink, diancie, mega_diancie, rockruff, lycanroc, lycanrocn, lycanrocd, fomantis, lurantis,},
}

