# sumcol
Firstie's Summons Collection - a collection of additional summon spells for Dungeon Siege.

## Principles
Stats are based on numbers of similar original summoning spells. See below for details on balancing.\
For stationary summons, gold value, duration & mana cost are much lower.\
For miniboss summons, scrolls are used; gold value is much lower & duration is much higher.\
All spells are Nature Magic because they deserve more love!

## Installation
Put the "Summons Collection.dsres" file into the DSLOA (or Resources) folder.\
Alternatively, pick from the partial .dsres files, which are split by creature type (animals / elementals...) or functional type (standard / stationary / miniboss) or by DS version (vanilla / LoA).\
Spells are added to PContent, which means they should appear in shops & drops with some probability. Note: unfortunately, scrolls are excluded from PContent, so they won't appear.

## Features:
- Animals
  - Phraks: Phrak, Phrak Piercer
    - Miniboss: Phrak Ballista
  - Spiders: Yellow Spider
  - Manglers: Snapper
  - Dogs: Krug Dog
  - Lizards: Island Lizard (LoA)
  - Stationary:
    - Skrubbs: Farm Skrubb, Black Skrubb
- Elementals
  - Gargoyles: Gargoyle (melee)
  - Ice Flies: Ice Fly
- Undead
  - Skeletons: Skeleton Archer, Skeleton Guard
    - Miniboss: Skeleton Captain

## Balancing

Gold Value is based on a formula reconstructed from original:\
Required Level 0-30: gold value = 30 * 10^(required level / 10)\
Required Level 30+:  gold value = 30 * 10^(required level / 50 + 2.4)\
Melee summons get 20% discount; stationary summons & miniboss scrolls get 80% discount.
