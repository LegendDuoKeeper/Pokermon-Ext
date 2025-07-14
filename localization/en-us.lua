return {
    descriptions = {
        Joker = {
            j_poke_ext_shaymin_land = {
                name = "Shaymin (Land Forme)",
                text = {
                  "Gains {X:red,C:white}X{} Mult equal to {X:red,C:white}X#1#{}",
                  "the amount of Chips each scored",
                  "{C:attention}Enhanced card{} would score.",
                  "Removes card {C:attention}enhancements{}.",
                  "{C:inactive}(Currently {X:red,C:white}X#2#{C:inactive} Mult)",
                  "{C:inactive,s:0.8}(Transforms at {C:attention,s:0.8}#3#{C:inactive,s:0.8} / #4# removed enhancements)"
                }
            },
            j_poke_ext_shaymin_sky = {
                name = "Shaymin (Sky Forme)",
                text = {
                  "Gives {X:red,C:white}X#1#{} Mult.",
                  "Repeat this effect when",
                  "an {C:attention}Enhanced card{} is scored."
                }
            },
            j_poke_ext_petilil = {
                name = "Petilil",
                text = {
                  "Each played {C:spades}Spade{} card gives",
                  "{C:chips}+#2#{} Chips and {C:mult}+#3#{} Mult when scored",
                  "during {C:attention}final hand{} of round",
                  "Earn {C:money}$#1#{} at end of round", 
                  "when {C:attention}0{} hands remaining",
                  "{C:inactive,s:0.8}(Evolves with a {C:attention,s:0.8}Leaf Stone{C:inactive,s:0.8} or a {C:attention,s:0.8}Sun Stone{C:inactive,s:0.8})",
                }
            },
            j_poke_ext_lilligant = {
                name = "Lilligant",
                text = {
                  "Gains {X:red,C:white}X#2#{} Mult for every {C:attention}15{} scored",
                  "{C:spades}Spades{} and loses {X:red,C:white}X#3#{} Mult for each",
                  "scored card that isn't a {C:spades}Spade{}",
                  "{C:mult}Self destructs{} when below {X:red,C:white}X1{} Mult",
                  "{C:inactive,s:0.8}(Currently {X:red,C:white}X#1#{C:inactive,s:0.8} Mult, {C:attention,s:0.8}#4#{}{C:inactive,s:0.8}/15 {C:spades,s:0.8}Spades{C:inactive,s:0.8} scored)"
                }
            },
            j_poke_ext_lilliganth = {
                name = "Lilligant-Hisui",
                text = {
                    "{C:green}#2# in #3#{} chance for played {C:spades}Spade{}",
                    "cards to give {X:red,C:white}X#1#{} Mult when scored",
                    "Chance increases by 1 for each",
                    "{X:fire,C:white}Fire{} Joker you have"
                }
            },
            j_poke_ext_joltik = {
                name = "Joltik",
                text = {
                  "{C:attention}Drain {C:money}$#1#{} from all other",
                  "Jokers at end of shop",
                  "{br:3.5}text needs to be here to work",
                  "When this Joker evolves,",
                  "Create a {C:dark_edition}Negative {C:attention}Devil{} for each",
                  "{C:money}$6{} of sell value this joker has",
                  "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#2#{C:inactive,s:0.8} rounds)",
                  "{C:inactive,s:0.8}(Currently makes {C:attention,s:0.8}#3#{} {C:dark_edition,s:0.8}Negative{C:attention,s:0.8} Devils{C:inactive,s:0.8})"
                }
            },
            j_poke_ext_galvantula = {
                name = "Galvantula",
                text = {
                  "Removes enhancements from",
                  "all scored {C:attention}Gold{} cards",
                  "{br:3.5}text needs to be here to work",
                  "Gains {C:mult}+#2#{} Mult and {C:money}$#4#{} per",
                  "enhancement removed",
                  "{C:inactive,s:0.8}(Currently gives {C:mult}+#1#{} {C:inactive,s:0.8}Mult",
                  "{C:inactive,s:0.8} and earns {C:money}$#3#{C:inactive,s:0.8}/#5# at end of round)"
                }
            },
            j_poke_ext_carbink = {
                name = 'Carbink',
                text = {
                    "{C:green}#3#% Chance{} to {C:mult}self destruct{} at end of round",
                    "Changes suit of leftmost scoring card",
                    "in {C:attention}first hand{} of round to {C:diamonds}Diamond{}",
                    "{C:inactive,s:0.8}(Chance is equal to{C:diamonds,s:0.8} Diamonds{C:inactive,s:0.8} in deck / #2#)",
                }
            },
            j_poke_ext_diancie = {
                name = 'Diancie',
                text = {
                    "{C:attention}Retrigger{} each played {C:diamonds}Diamond{}",
                    "{br:2.5}text needs to be here to work",
                    "Played {C:diamonds}Diamond{} cards",
                    "give {C:mult}+#1#{} Mult when scored",
                }
            },
            j_poke_ext_mega_diancie = {
                name = 'Mega Diancie',
                text = {
                    "{C:attention}Retrigger{} each played {C:diamonds}Diamond{}",
                    "{br:2.5}text needs to be here to work",
                    "Played {C:diamonds}Diamond{} cards give",
                    "{X:red,C:white}X#1#{} Mult and {C:gold}$1{} when scored",
                }
            },
            j_poke_ext_cutiefly = {
                name = 'Cutiefly',
                text = {
                    "When hand is played, {C:green}#3# in #4#{} chance",
                    "to make a random {C:item}Item{} card",
                    "Chance increases by 1 for each",
                    "{X:grass,C:white}Grass{} joker you have",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#1#{C:inactive,s:0.8} rounds)",
                }
            },
            j_poke_ext_ribombee = {
                name = 'Ribombee',
                text = {
                    "If you don't have a {C:attention}Honey{} card",
                    "Create a {C:attention}Honey{} card after",
                    "{C:attention}#1#{} rounds, Decreases an additional time",
                    "for each {X:grass,C:white}Grass{} joker you have",
                }
            },
            j_poke_ext_rockruff = {
                name = 'Rockruff',
                text = {
                    "Played {C:clubs}#4#{} cards give {C:mult}+#1#{} Mult when scored",
                    "{C:inactive,s:0.8}(Evolved form based on number of {C:clubs}#4#{C:inactive,s:0.8} cards in deck)",
                    "{C:inactive,s:0.8}({C:attention,s:0.8}<20{C:inactive,s:0.8} for Morning, {C:attention,s:0.8}20-30{C:inactive,s:0.8} for Night, {C:attention,s:0.8}>30{C:inactive,s:0.8} for Dusk)",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#2#{C:inactive,s:0.8} rounds, Currently {C:attention,s:0.8}#3#{C:inactive,s:0.8} {C:attention,s:0.8}{C:clubs}#4#{}{C:inactive,s:0.8} cards in deck)"
                }
            },
            j_poke_ext_lycanroc = {
                name = 'Lycanroc',
                text = {
                    -- "If {C:attention}first hand{} of round contains at least {C:attention}3{} scoring {C:clubs}Clubs{},",
                    "If {C:attention}played hand{} contains at least {C:attention}2{} scoring {C:clubs}Clubs{},",
                    "{C:green}#1# in #2#{} chance to add a permanent copy of a random",
                    "scored {C:clubs}Club{} to deck and draw it to {C:attention}hand{}"
                }
            },
            j_poke_ext_lycanrocn = {
                name = 'Lycanroc-Night',
                text = {
                    "Gains {X:red,C:white}X#2#{} Mult per", 
                    "scoring {C:clubs}Club{} played",
                    "{C:inactive,s:0.8}(Currently {X:red,C:white}X#1#{C:inactive,s:0.8} Mult)"
                }
            },
            j_poke_ext_lycanrocd = {
                name = 'Lycanroc-Dusk',
                text = {
                    "Played {C:clubs}Club{} cards",
                    "give {X:red,C:white}X#1#{} Mult when scored"
                }
            },
            j_poke_ext_fomantis = {
                name = "Fomantis",
                text = {
                  "After scoring {C:attention}#1#{C:hearts} Heart{} cards,",
                  "Create a {C:attention}Sun{} card at end of round",
                  "No longer makes {C:attention}Sun{} cards after {C:attention}4{} rounds",
                  "{C:inactive}(Currently {C:attention}#2#{C:inactive}/{C:attention}#1#{C:inactive}) (Must have room)",
                  "{C:inactive,s:0.8}(Currently {C:attention,s:0.8}#3#{C:inactive,s:0.8} rounds left) (Evolves with a {C:attention,s:0.8}Sun Stone{C:inactive,s:0.8})"
                }
            },
            j_poke_ext_lurantis = {
                name = "Lurantis",
                text = {
                  "If the leftmost scored card in",
                  "played hand is a {C:hearts}Heart{}, destroy it",
                  "{br:3.5}text needs to be here to work",
                  "Gains {X:red,C:white}X#2#{} Mult per {C:hearts}Heart{} card",
                  "destroyed, this gain is doubled if",
                  "destroyed card had an {C:attention}Enhancement{}",
                  "{C:inactive}(Currently: {X:red,C:white}X#1#{}{C:inactive} Mult){}"
                }
            },
            j_poke_ext_a_vulpix = {
                name = 'Vulpix',
                text = {
                    "{C:green}#1# in #2#{} chance for the",
                    "{C:attention}first scored 9 each hand{}",
                    "to become {C:dark_edition}Foil, Holographic{}",
                    "or {C:dark_edition}Polychrome{} edition",
                    "{C:inactive,s:0.8}(Evolves with an {C:attention,s:0.8}Ice Stone{C:inactive,s:0.8})"
                } 
            },
            j_poke_ext_a_ninetales = {
                name = 'Ninetales',
                text = {
                    "{C:green}#1# in #2#{} chance for the {C:attention}first{}",
                    "{C:attention}played 9{} every hand to",
                    "create a permanent {C:dark_edition}Polychrome{}",
                    "copy and draw it to {C:attention}hand{}"
                } 
            },
            j_poke_ext_giratina = {
                name = "Giratina",
                text = {
                    "Creates a{C:dark_edition} Distortion{}",
                    "{C:attention}voucher{} in the shop",
                    "when sold"
                }
            },
            j_poke_ext_munna = {
                name = "Munna",
                text = {
                    "When {C:attention}Small Blind{} or {C:attention}Big Blind{}",
                    "is selected, {C:inactive}Sleep{} a random card",
                    "in full deck that doesn't have a {C:attention}seal{}",
                    "{br:3.5}text needs to be here to work",
                    "{C:green}#1# in #2#{} chance to create a {C:purple}Tarot{}",
                    "card when a {C:attention}Statused{} card is scored",
                    "{C:inactive,s:0.8}(Evolves with a {C:attention,s:0.8}Moon Stone{C:inactive,s:0.8})",
                }
            },
            j_poke_ext_musharna = {
                name = "Musharna",
                text = {
                    "When {C:attention}Small Blind{} or {C:attention}Big Blind{}",
                    "is selected, create a {C:pink}Dream Mist{}",
                    "{br:3.5}text needs to be here to work",
                    "{C:attention}Retrigger{} all scored Statused cards",
                }
            },
            j_poke_ext_mareanie = {
                name = "Mareanie",
                text = {
                    "When {C:attention}round begins{}, {C:purple}Poison{} a random card",
                    "held in hand that doesn't have a {C:attention}seal{}",
                    "{br:3.5}text needs to be here to work",
                    "Played cards with {C:attention}Statuses{}",
                    "give {C:chips}+#1#{} chips when scored",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#2#{C:inactive,s:0.8} rounds)"
                }
            },
            j_poke_ext_toxapex = {
                name = "Toxapex",
                text = {
                    "If the leftmost scoring card in {C:attention}first hand",
                    "of round doesn't have a {C:attention}seal{}, {C:purple}Poison{} it",
                    "{br:3.5}text needs to be here to work",
                    "Played cards with {C:attention}Statuses{}",
                    "give {C:chips}+#1#{} chips when scored"
                }
            },
            j_poke_ext_sizzlipede = {
                name = "Sizzlipede",
                text = {
                    "When {C:attention}round begins{}, {C:red}Burn{} a random card",
                    "held in hand that doesn't have a {C:attention}seal{}",
                    "{br:3.5}text needs to be here to work",
                    "Played cards with {C:attention}Statuses{}",
                    "give {C:mult}+#1#{} Mult when scored",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#2#{C:inactive,s:0.8} rounds)"
                }
            },
            j_poke_ext_centiskorch = {
                name = "Centiskorch",
                text = {
                    "If {C:attention}first discard{} of round is exactly",
                    "1 card and it doesn't have a {C:attention}seal{}, {C:red}Burn{} it",
                    "{br:3.5}text needs to be here to work",
                    "Played cards with {C:attention}Statuses{}",
                    "give {C:mult}+#1#{} Mult when scored"
                }
            },
            j_poke_ext_snom = {
                name = "Snom",
                text = {
                    "Gains {X:red,C:white}X#2#{} Mult per", 
                    "scoring {C:attention}Statused{} card played",
                    "{br:3.5}text needs to be here to work",
                    "{C:attention}Volatile Right",
                    "{C:chips}Freeze{} a random scoring card", 
                    "without a {C:attention}seal{} in played hand",
                    "{C:inactive,s:0.8}(Evolves at {X:red,C:white}X#1#{C:inactive,s:0.8}/{X:inactive,C:white}X2{C:inactive,s:0.8} Mult)"
                }
            },
            j_poke_ext_frosmoth = {
                name = "Frosmoth",
                text = {
                    "Gains {X:red,C:white}X#2#{} Mult per", 
                    "scoring {C:attention}Statused{} card played",
                    "{br:3.5}text needs to be here to work",
                    "{C:attention}Volatile Right",
                    "{C:chips}Freeze{} a random scoring card", 
                    "without a {C:attention}seal{} in played hand",
                    "{C:inactive,s:0.8}(Currently {X:red,C:white}X#1#{C:inactive,s:0.8} Mult)"
                }
            },
            j_poke_ext_tadbulb = {
                name = "Tadbulb",
                text = {
                    "When hand is played, {C:green}#1# in #4#{} chance to {C:yellow}Paralyze{}",
                    "a random card in hand that doesn't have a {C:attention}seal",
                    "{br:3.5}text needs to be here to work",
                    "Earns {C:money}$#2#{} at end of round for every",
                    "3 {C:attention}Statused{} cards in your full deck",
                    "{C:inactive,s:0.8}(Currently earns {C:money}$#3#{C:inactive,s:0.8}/$#5# at end of round)",
                    "{C:inactive,s:0.8}(Evolves with a {C:attention,s:0.8}Thunder Stone{C:inactive,s:0.8})"
                    
                }
            },
            j_poke_ext_bellibolt = {
                name = "Bellibolt",
                text = {
                    "When hand is played, {C:green}#1# in #4#{} chance to {C:yellow}Paralyze{}",
                    "a random card held in hand that doesn't have a {C:attention}seal",
                    "{br:3.5}text needs to be here to work",
                    "Earns {C:money}$#2#{} at end of round for every",
                    "4 {C:attention}Statused{} cards in your full deck",
                    "{C:inactive,s:0.8}(Currently earns {C:money}$#3#{C:inactive,s:0.8}/$#5# at end of round)"
                }
            },
            j_poke_ext_sneaselh = {
                name = "Sneasel-Hisui",
                text = {
                    "If {C:attention}first hand{} of round contains a set of",
                    "{C:attention}exactly{} 3 cards with {C:attention}matching ranks{},",
                    "{C:purple}Poison{} a random scoring card without a seal",
                    "{br:3.5}text needs to be here to work",
                    "Gains {C:mult}+#1#{} Mult for each {C:purple}Poisoned{} card in full deck",
                    "{C:inactive,s:0.8}(Currently {C:mult,s:0.8}+#2#{C:inactive,s:0.8} Mult, Evolves with a {C:attention,s:0.8}Sun Stone{C:inactive,s:0.8})"
                }
            },
            j_poke_ext_sneasler = {
                name = "Sneasler",
                text = {
                    "If {C:attention}first hand{} of round contains a set of",
                    "{C:attention}exactly{} 3 cards with {C:attention}matching ranks{}, the cards",
                    "in that set become {C:purple}Poisoned{}, {C:money}Paralyzed{}, and {C:inactive}Asleep{}",
                    "from left to right if they don't have a seal",
                    "{br:3.5}text needs to be here to work",
                    "Gains {C:mult}+#1#{} Mult for each {C:purple}Poisoned{}, {C:money}Paralyzed{},",
                    "and {C:inactive}Asleep{} card in full deck {C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
                }
            },
        },

        Spectral = {
            -- c_poke_ext_honey = {
            --     name = "Honey",
            --     text = {
            --         "+1 Shop Slot",
            --         "Use to create",
            --         "a{C:colorless} Shiny{} tag",
            --     },
            -- },
        },

        Item = {
            c_poke_ext_honey = {
                name = "Honey",
                text = {
                    "{C:attention}+1{} Shop Slot",
                    "Use to create",
                    "a random tag",
                },
            },
            c_poke_ext_dream_mist = {
                name = "Dream Mist",
                text = {
                    "{C:inactive}Sleeps {C:attention}2{} selected unsealed cards",
                    "Creates a {C:colorless}Colorless{} energy",
                    "{C:inactive}(Must have room){}",
                },
            },
            c_poke_ext_charcoal = {
                name = "Charcoal",
                text = {
                    "{C:mult}Burns {C:attention}2{} selected unsealed cards",
                    "Those cards {C:attention}permanently{} gain {C:mult}+6{} Mult",
                },
            },
            c_poke_ext_magnet = {
                name = "Magnet",
                text = {
                    "{C:gold}Paralyzes {C:attention}2{} selected unsealed cards",
                    "A random sealed card in hand becomes a {C:attention}Steel{} card",
                },
            },
            c_poke_ext_nevermeltice = {
                name = "NeverMeltIce",
                text = {
                    "{C:chips}Freezes {C:attention}2{} selected unsealed cards",
                    "Create a {C:dark_edition}Foil{} tag if you don't already have one",
                },
            },
            c_poke_ext_poison_barb = {
                name = "Poison Barb",
                text = {
                    "{C:purple}Poisons {C:attention}2{} selected unsealed cards",
                    "Destroys a random {C:attention}unsealed{} card",
                },
            },
        },
        

        Voucher = {
            v_poke_ext_distortion = {
                name = "Distortion",
                text = {
                    "Replaces {C:attention}Edition{} of a",
                    "random playing card in deck",
                    "with {C:dark_edition}Negative{}, {C:attention}Death{} {C:tarot}Tarot{}",
                    "cards no longer appear"
                },
            },
        },

        Other = {
            poke_ext_burned_seal = {
                name = "Burned Seal",
                text = {
                    "{C:chips}-25{} chips", 
                    "{C:inactive}(Can go negative){}",
                }
            },
            poke_ext_para_seal = {
                name = "Paralyzed Seal",
                text = {
                    "{C:green}1 in 3{} chance", 
                    "to score as debuffed",
                }
            },
            poke_ext_poison_seal = {
                name = "Poisoned Seal",
                text = {
                    "{X:red,C:white}X0.8{} Mult",
                }
            },
            poke_ext_sleep_seal = {
                name = "Sleep Seal",
                text = {
                    "{C:mult}-1{} discards this",
                    "round when scored", 
                    "{C:chips}-1{} hands this round",
                    "when manually discarded",
                }
            },
            poke_ext_frozen_seal = {
                name = "Frozen Seal",
                text = {
                    "Lose {C:money}$2{} when this",
                    "card is scored",
                }
            },
            poke_ext_honey_table = {
                name = "Honey Table",
                text = {
                    "{C:green}40%{} {C:green}Uncommon{} Tag",
                    "{C:green}25%{} {C:attention}Stage 1{} Tag",
                    "{C:green}15%{} {C:mult}Rare{} Tag",
                    "{C:green}10%{} {C:safari}Safari{} Tag",
                    "{C:green}10%{} {C:colorless}Shiny{} Tag",
                }
            },
        },
    },

        
    misc = {
        dictionary = {
            poke_ext_settings_experimental = "Enable Experimental Elements?",
            poke_ext_settings_giratina = 'Enable Giratina?'
        },
        labels = {
            poke_ext_burned_seal = "Burned Seal",
            poke_ext_para_seal = "Paralyzed Seal",
            poke_ext_poison_seal = "Poisoned Seal",
            poke_ext_sleep_seal = "Sleep Seal",
            poke_ext_frozen_seal = "Frozen Seal",
            
        },
    },
}
