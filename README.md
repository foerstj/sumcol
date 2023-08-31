# sumcol
Firstie's Summons Collection - a collection of additional summon spells for Dungeon Siege.

This collection aims to provide more fun and useful options, esp. ranged summons for nature mages, and to experiment with unusual summons like stationaries & miniboss scrolls.

## Principles
Stats are based on numbers of similar original summoning spells. See below for details on balancing.\
For stationary summons, gold value, duration & mana cost are much lower.\
For miniboss summons, scrolls are used; gold value is much lower, duration & life is much higher.\
Required level is a few levels higher than the level where players typically first encounter the creature.\
Assignment to Nature vs. Combat Magic is done based on the creature, roughly following the shaky logic of the original spells.

## Installation
Put the "Summons Collection.dsres" file into the DSLOA (or Resources) folder.\
Alternatively, pick from the partial .dsres files, which are split by creature type (animals / elementals...) or functional type (standard / stationary / miniboss) or by DS version (vanilla / LoA).\
Spells are added to PContent, which means they should appear in shops & drops with some probability.\
Note: unfortunately, scrolls are excluded from PContent, so they won't appear on original maps without mods. See my minimod scrolls-in-shops for a solution.

## Features:
- Animals (NM):
  - Phraks: Phrak, Phrak Piercer
    - Miniboss: Phrak Ballista
  - Spiders: Yellow Spider
  - Manglers: Snapper
  - Dogs: Krug Dog
  - Lizards: Island Lizard (LoA)
  - Stationary:
    - Skrubbs: Farm Skrubb, Black Skrubb
- Elementals
  - Gargoyles (CM): Gargoyle (melee)
  - Ice (NM): Ice Warrior, Ice Archer, Ice Fly
  - Swamp (NM): Swamp Creature, Swamp Slinger
- Undead (CM):
  - Skeletons: Skeleton Archer, Skeleton Guard
    - Miniboss: Skeleton Captain
- Plants (NM):
  - Stationary:
    - Vines: Killer Vines (LoA)

## Balancing

Gold Value: is based on a formula reconstructed from original:\
Required Level 0-30: gold value = 30 * 10^(required level / 10)\
Required Level 30+:  gold value = 30 * 10^(required level / 50 + 2.4)\
Melee summons get 20% discount; stationary summons & miniboss scrolls get 80% discount.

Duration: base duration for standard summons is 5 minutes.\
Stationary summons have 1 minute, because you'll have to re-summon them frequently anyway.\
Miniboss scrolls get a full 15 minutes, because they're single-use. Make sure to heal them!\
Bonus minutes are given for melee summons and for slow creatures, because these factors waste a bit of time.\
Further bonus/minus minutes are given to counter the damage & health/defense values a bit.

Level cap: the maximum level (from which on the summon doesn't get stronger anymore) is always the required level + 20.\
Most originals follow this scheme as well, with a few minor deviations. (The only really odd one out is Summon Clone, by the way, which improves all the way from level 15 to level 65.)

Alterations: All summons use the same alteration formulas to make balancing simple & comprehensible.\
Damage: based on caster's level with slight variation corresponding to the creature's properties. (Factors 0.9 and 1.1 applied for min and max damage respectively.)\
Only slight variation here with factors between 0.8 and 1.2 because damage affects XP balancing! Miniboss scrolls get an additional +0.2 damage factor on top of that of their base creature.\
Defense & Health: based on caster's level with variations corresponding to the creature's properties. Miniboss scrolls get 3x the health of their base creature.\
Level (melee/ranged/CM): based on caster's level.\
Strength/Dexterity/Intelligence: based on caster's level.\
Mana: based on caster's level.
