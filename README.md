An add-on to the Pokermon mod (original mod and credit to creator in "About")

A thanks to NhanBread for helping me through the process of coding my first project

Basically everything here likely needs some amount of small tweaks, with some more obvious offenders who are due for some larger ones, but hopefully
the theming for them is appreciated and some of these become proper additions after those tweaks.

Currently adds:

  9 new pokemon lines:

  - Giratina (Very Experimental)

  - Petilil + both Lilligants

  - Joltik + Galvantula (Co-designed with Beoulve)

  - Carbink + Diancie and Mega Diancie (some liberties were taken grouping these two together)

  - Cutiefly + Ribombee

  - Rockruff + 3 Lycanrocs

  - Fomantis + Lurantis (Co-designed with Beoulve)

  - Alolan Vulpix + Ninetales (Designed by TekkyAnonymous)

  - Shaymin + Sky Forme (Designed by TekkyAnonymous)

---
  
  1 New Voucher
  
  - Distortion (Also very Experimental)

---
  
  1 New Item

  - Honey (Art by DaleWillFail) (Still being tweaked)

---
  
  1 Balance change

  - Metal Coat will now make an editionless Steel copy of selected card if selected card is Negative (Only relevant for Giratina and/or additional mods)

---

To do list:

  - Add a proper config menu, including an on/off toggle for more experimental elements

  - Potentially rework Shaymins, Lilligant-Hisui, Cutiefly/Ribombee, and Lycanroc-Day after getting more outside feedback

  - Pretty up descriptions on certain jokers

  - Request and/or implement a way to prevent certain jokers from being called by pokeball items (Diancie, Shaymin-Sky Forme)

  - Get sidetracked by other ideas and make more jokers before finishing above tasks

---

Known issues:

  - Attempting to unevolve Mega-Diancie crashes due to a conflict with the mega code and outside additions

  - Giratina is really wacky and may either be scrapped or moved to a different pokemon with better theming, but also needs more outside feedback

  - Carbink and Rockruff sometimes display an inaccurate total, cause currently unknown

  - Diancie is currently an Uncommon joker for testing purposes, it probably will go back to Rare

---

Short-ish explanation for why each joker does what it does:

  I started this project almost entirely from a desire to add jokers to make the non-Heart suits better because they had comparatively weak support at the time.

  - Petilil's Dex entry talks about its leaves being reinvigorating, so I applied that to gaining a burst of energy for the last hand of the round. It was given spades
    due to the Lilligants having association with dancing, and the World Tarot card has a dancer on it.

    Lilligant's Dex entry mentions how difficult it is to take care of, often withering at the slightest lapse in maintenance. I attempted to re-create these maintenance
    difficulties by including a rather harsh punishment for playing the wrong suit, but to otherwise give a reasonably strong payout for a spade deck.

    I'm currently not thrilled with how Lilligant-H works, but its Dex entries give little to nothing to work with, and I wanted to try theming it around a Sun-based effect
    as best as I could for an environment with no weather effects. It does function quite similarly to Exeggutor, which is partly why I'm unhappy with it.

  - Carbink and Diancie are one of the most related pairs of pokemon that don't share an evolution line, and Diancie's signature move is Diamond Storm, so having it be
    the huge Diamond payout I was looking for just made too much sense. The Gros Michel/Cavendish relation seemed like a nice way to tie in Diancie being a rare
    mutation of Carbink, and Pokermon didn't have a Diamond enabler (cleffa, igglybuff, etc.) yet, so giving that effect to Carbink made sense to me.

  - Rockruff and co. are loosely tied to a werewolf type gimmick, which ties in to the Moon Tarot card for Clubs, which rounds out each of the suits. I really like the 
    concept of having the form you get be based off of the total number of clubs in your deck, but it feels like the numbers still need some work.

    Lycanroc-Day's effect is the one I'm least happy with. My initial vision with this line was to encourage a play pattern that included using Lycanroc-Day
    to both help you get to the other forms, and make them better when you got to them. However, making this play pattern feel good has been difficult, and the theming
    behind Day form copying cards is almost non-existant. These 2 factors will likely lead to me redoing this form's effect depending on what feedback it ends up getting.

    On the other hand, I am rather happy with where the other 2 forms are at. Lycanroc-Night is a strong but kinda slow scaling joker, and Lycanroc-Dusk is the
    big payoff for successfully navigating the "dilemma" of sorts the Rockruff timer was supposed to present.

---

And now for the other jokers that came after my mission to make non-Heart suits better:

  - Joltik is known to leech off of other pokemon to create electricity, which is where the drain effect comes from. Having it "make" gold cards seemed like a good way
    to have a thematic payoff since electric pokemon are already quite tied to money and gold cards.

    Galvantula's effects are very much a follow-up payout to Joltik's, with some theming borrowed from a part of the Pokemon anime where Galvantula was shown to eat
    Thunder Stones. We worked on Galvantula before hazards were added, and despite it probably being a good fit for hazards, we currently have no plans to change it.

  - Cutiefly and Ribombee are bees with the ability Honey Gather, which led me to giving them an item based payoff that gets better with more Grass pokemon to collect
    honey from. These 2 are still very new and haven't had much testing.

  - We started with Lurantis before Fomantis for this line, and after scrapping a few ideas we wanted to sort of combine a dagger-esque effect with a Sun-powered theme 
    to tie in with it's "signature" move Solar Blade, and the fact that its mantis-y nature to eat things. This led us to having Lurantis scale of off destorying hearts,
    which has played better than we expected, but might still need some tweaks to offset how strong removing 13 cards in 4-5 rounds is.

    Pokermon didn't have a heart enabler (cleffa, igglybuff, etc.) yet, so tying that to Fomantis who is known to take energy from the sun, (tied back to the Sun Tarot card)
    to help its evolved form seemed reasonable. Hitting all 4 opportunities for a Sun card isn't as easy as it may sound, which helps keep it in check.

---

  (Writeups for Tekky's Jokers go here)

Last but not least, we have the problem child, my best effort to introduce Negative playing cards without having it become clearly the most broken thing in the mod:

  - As mentioned, this idea started from me trying to tastefully implement Negative playing cards. I tried to think through what I would have to do to keep Negative cards 
    balanced before I picked a Pokemon to attach them to, but eventually landed on Giratina. A reoccuring source of Negative cards on a Joker is pretty much out of the question, 
    which led me to looking for a one time effect to spawn/convert a limited number of Negative cards. 

    Selling Giratina to make a voucher for this effect was the first thing I came up with, and to this point I haven't thought of anything better that also checks the rest of 
    the boxes I had in mind. After the player has a Negative card, if there's no downside attached to it, things are bound to get broken very quickly thanks to relentless abuse 
    of the Death Tarot card and the near-infinite potential with held-in-hand effects. 

    This leads us to the downside, preventing the player from ever finding another Death, forcing them to either rely on copy effects (note Metal Coat is changed in this 
    add-on to not copy the Negative edition of anything) or making sure they hold onto a Death before they activate Giratina's effect, to make more with the Fool Tarot card, 
    effectively losing a consumable slot permanently. 

    I feel I could test this concept for hours by myself and still not have an accurate judgment of how strong it is, which is why I've left it in to be judged by others.
