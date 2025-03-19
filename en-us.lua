return {
    descriptions = {
        Joker = {
            j_poke_ext_petilil = {
                name = "Petilil",
                text = {
                  "Each played {C:spades}Spade{} card gives",
                  "{C:chips}+#2#{} Chips and {C:mult}+#3#{} Mult when scored",
                  "during {C:attention}final hand{} of round",
                  "Earn {C:money}$#1#{} at end of round", 
                  "when {C:attention}0{} hands remaining",
                  "{C:inactive,s:0.8}(Evolves with a {C:attention,s:0.8}Sun Stone{C:inactive,s:0.8})",
                }
            },
            j_poke_ext_lilligant = {
                name = "Lilligant",
                text = {
                  "Gains {X:red,C:white}X#2#{} Mult for every {C:attention}15{} scored",
                  "{C:spades}Spades{} and loses {X:red,C:white}X#3#{} Mult for every",
                  "played card that isn't a {C:spades}Spade{}",
                  "{C:mult}Self destructs{} when below {X:red,C:white}X1{} Mult",
                  "{C:inactive,s:0.8}(Currently {X:red,C:white}X#1#{C:inactive,s:0.8} Mult, {C:attention,s:0.8}#4#{}{C:inactive,s:0.8}/15 {C:spades,s:0.8}Spades{C:inactive,s:0.8} scored)"
                }
            },
            j_poke_ext_joltik = {
                name = "Joltik",
                text = {
                  "{C:attention}Drain {C:money}$#1#{} from all other",
                  "Jokers at end of shop",
                  "{br:3.5}text needs to be here to work",
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
                  "enchantment removed",
                  "{C:inactive,s:0.8}(Currently gives {C:mult}+#1#{} {C:inactive,s:0.8}Mult",
                  "{C:inactive,s:0.8} and earns {C:money}$#3#{C:inactive,s:0.8}/#5# at end of round)"
                }
            },
            j_poke_ext_carbink = {
                name = 'Carbink',
                text = {
                    "{C:green}Percent Chance{}",
                    "Chance to {C:mult}self destruct{} at end of round",
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
                    "Played {C:diamonds}Diamond{} cards",
                    "give {X:red,C:white}X#1#{} Mult and {C:gold}$1{} when scored",
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
                    "If {C:attention}played hand{} contains at least {C:attention}3{} scoring {C:clubs}Clubs{},",
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
                  "After scoring {C:attention}#1#{C:hearts} Hearts{},",
                  "Create a {C:attention}Sun{} card at end of round",
                  "No longer makes {C:attention}Sun{} cards after {C:attention}4{} rounds",
                  "{C:inactive}(Currently {C:attention}#2#{C:inactive}/{C:attention}#1#{C:inactive}) (Must have room)",
                  "{C:inactive,s:0.8}(Currently {C:attention,s:0.8}#3#{C:inactive,s:0.8} rounds left) (Evolves with a {C:attention,s:0.8}Sun Stone{C:inactive,s:0.8})"
                }
            },
            j_poke_ext_lurantis = {
                name = "Lurantis",
                text = {
                  "If the leftmost scored card is {C:hearts}Hearts{}, destroy it.",
                  "{br:3.5}text needs to be here to work",
                  "Gains {X:red,C:white}X#2#{} Mult per {C:hearts}Heart{} that is",
                  "destroyed. Gain {X:red,C:white}X0.3{} Mult instead if",
                  "that card had an {C:attention}Enhancement{}.",
                  "{C:inactive}(Currently: {X:red,C:white}X#1#{}{C:inactive} Mult){}"
                }
            },
            j_poke_ext_a_vulpix = {
                name = 'Vulpix',
                text = {
                    "{C:green}#1# in #2#{} chance for",
                    "{C:attention}each played 9{} to create",
                    "an {C:spectral}Aura{} when scored",
                    "{C:inactive,s:0.8}(Must have room)",
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
        },

        Voucher = {
            v_poke_ext_baddreams = {
                name = "Bad Dreams",
                text = {
                    "Replaces Edition of a",
                    "random playing card in deck",
                    "with Negative, Death Tarot",
                    "cards no longer spawn"
                },
            },
        },
    }
}
