default_poke_custom_prefix = "poke_ext"

local check_main_scoring = function(main)
    if SMODS.version >= '1.0.0~ALPHA-1315b' then
      return main
    else
      return true
    end
  end

local burned = {
    name = "burned",
	key = "burned",
	badge_colour = HEX("F92626"),
	atlas = "seals1",
    pos = {x = 2, y = 0},
    experiment = true,
    config = {chips = -25, status = 1},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.seal.chips}}
    end,
    in_pool = function(self)
        return false
    end,
    calculate = function(self, card, context)
		if context.cardarea == G.play and not context.repetition_only and check_main_scoring(context.main_scoring) then
            return {
                colour = G.C.CHIPS,
                chips = card.ability.seal.chips
            }
        end
    end,
}

local para = {
    name = "para",
	key = "para",
	badge_colour = HEX("EFEE1F"),
	atlas = "seals1",
    pos = {x = 4, y = 0},
    experiment = true,
    config = {odds = 3, status = 1},
    loc_vars = function(self, info_queue, center)
        return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.seal.odds}}
    end,
    in_pool = function(self)
        return false
    end,
    calculate = function(self, card, context)
        if pseudorandom('paralyze') < ((G.GAME and G.GAME.probabilities.normal or 1) / card.ability.seal.odds) then
            if context.before and context.cardarea == G.play then
                card:set_debuff(true)
            end
        end
    end,
}

local poison = {
    name = "poison",
	key = "poison",
	badge_colour = HEX("6504C5"),
	atlas = "seals1",
    pos = {x = 8, y = 0},
    experiment = true,
    config = {x_mult = 0.8, status = 1},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.seal.x_mult}}
    end,
    in_pool = function(self)
        return false
    end,
    calculate = function(self, card, context)
		if context.cardarea == G.play and not context.repetition_only and check_main_scoring(context.main_scoring) then
            return {
                colour = G.C.XMULT,
                Xmult_mod = card.ability.seal.x_mult
              }
        end
    end,
}

local sleep = {
    name = "sleep",
	key = "sleep",
	badge_colour = HEX("D5D4D6"),
	atlas = "seals1",
    pos = {x = 5, y = 0},
    experiment = true,
    config = {hands = -1, d_size = -1, trigger = true},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.seal.hands, center.ability.seal.d_size}}
    end,
    in_pool = function(self)
        return false
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and not context.repetition_only and check_main_scoring(context.main_scoring) then
            ease_discard(card.ability.seal.d_size)
        end
        if context.pre_discard then
            if context.hook then
                card.ability.seal.trigger = false
            else
                card.ability.seal.trigger = true
            end
        end
        if context.discard and card.seal == 'poke_ext_sleep' and card == context.other_card and card.ability.seal.trigger == true then  
            ease_hands_played(card.ability.seal.hands)
        end
    end,
}

local frozen = {
    name = "frozen",
	key = "frozen",
	badge_colour = HEX("41F1F1"),
	atlas = "seals1",
    pos = {x = 3, y = 0},
    experiment = true,
    config = {money_mod = 2, status = 1},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.seal.money_mod}}
    end,
    in_pool = function(self)
        return false
    end,
    calculate = function(self, card, context)
		if context.cardarea == G.play and not context.repetition_only and check_main_scoring(context.main_scoring) then
            return {
            colour = G.C.MONEY,
            dollars = 0 - card.ability.seal.money_mod
            }
        end
    end,
}

return {name = "Status Seals",
        list = {burned, para, sleep, poison, frozen,}
}