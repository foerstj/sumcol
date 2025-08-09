# sumcol

Firstie's Summons Collection - a collection of additional summon spells for Dungeon Siege.

This collection aims to provide more fun and useful options, esp. ranged summons for nature mages, and to experiment with unusual summons like stationaries & miniboss scrolls.


## Principles

Stats are based on numbers of similar original summoning spells. See below for details on balancing.\
For stationary & explosive summons, gold value, duration & mana cost are much lower.\
For miniboss summons, scrolls are used; gold value is much lower, duration & life is much higher.\
Required level is around 4/3 of the level where players typically first encounter the creature, similar to the original spells.\
Assignment to Nature vs. Combat Magic is done based on the creature, roughly following the shaky logic of the original spells.


## Installation

If you use DSLOA, put the "Summons Collection LoA" files into the DSLOA folder. They are split by functional type (Standard / Non-Standard) and by DS version of the creatures (KoE+UP = creatures from the Kingdom of Ehb & the Utraean Peninsula / LoA = creatures from the LoA map).

If you use vanilla DS1, put the "Summons Collection Vanilla" files into the Resources folder. They contain the Vanilla creatures (from the Kingdom of Ehb & the Utraean Peninsula), and are split by functional type (Standard / Non-Standard).

Don't use both at the same time, and don't use the LoA builds with vanilla DS1. The builds are different because the engines calculate damage differently.

Spells are added to PContent, which means they appear in shops & drops with some probability.\
Note: unfortunately, scrolls are excluded from PContent, so they won't appear on original maps without mods. See my minimod scrolls-in-shops for a solution.

### Compatibility
- If you play with vanilla DS, use only the Vanilla builds - LoA creatures would not work properly, and balancing of KoE+UP creatures would be off.
- This mod is compatible with Unlimited Summons, except for the explosive summons (Proxo & Blazing Elemental) and the Doppelgangers, which can still only be summoned once at a time.


## Features

- DS Versions: Both Vanilla and LoA (incl. separate builds for proper balancing)
- Magic Classes: Both Combat Magic and Nature Magic
- Creature Types: All sorts of creatures are supported - humanoids, animals, demonic creatures, plants, elementals, robots, and undead.
  Water creatures were omitted because summoning a Shrack or Hydrack on land would be weird.
- Feature Types: The summons fall into these categories:
  - Standard summons: The usual. A creature that fights alongside you. The bulk of the Summons Collection falls into this category.
  - Non-Standard summons: These contain the following sub-categories (summons can fall into more than one sub-category):
    - Stationary summons: Summons like the Skrubb can't follow you. To compensate, they cost only a fraction of the mana.
	- Miniboss Scrolls: Minibosses can also be summoned, but only once. They have somewhat higher damage and 3 times the health of their base creatures. Their duration is also a lot longer, so be sure to heal them from time to time.
	- Exploding summons: Summons like the Proxo explode to damage enemies. To compensate, they cost only a fraction of the mana.
	- Resurrecting summons: The Krug Shaman can resurrect your party members when someone dies.
	- Sub-summoning summons: Summons like the Swamp Witch will in turn summon another creature, e.g. a Swamp Slinger.
	- Healing summons: The Tesla Heal Coil will heal you, instead of attacking enemies.
	- Doppelganger summons: You summon a white cloud, which will turn into the first enemy it sees.
	  Note: This is the most experimental of all non-standard categories. The Doppelganger will behave weirdly in a different way for each new enemy type. Health of the doppel is based on the enemy.


## Creatures

Almost 300 creatures are available for summoning. The Summons Collection now features all (normal & suitable) enemies from KoE, UP & LoA.\
For a list of all supported creatures, see CREATURES.md.


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
Damage: based on caster's level, with slight variation corresponding to the creature's properties. (Factors 0.9 and 1.1 applied for min and max damage respectively.)\
Only slight variation here with factors between 0.8 and 1.2 because damage affects XP balancing! Miniboss scrolls get an additional +0.2 damage factor on top of that of their base creature.\
Defense & Health: based on caster's level, with variations corresponding to the creature's properties. Miniboss scrolls get 3x the health of their base creature.\
Level (melee/ranged/CM): based on caster's level, with a dip around level 50, to match the strength of original summons. (Since LoA, creature level is part of damage calculations.)\
Strength/Dexterity/Intelligence: based on caster's level.\
Mana: based on caster's level.

LoA vs. Vanilla builds:\
Some creatures have an additional attack balancing factor to counter certain properties of their attacks. For example, the Ice Mage's attack shoots 3 ice shards, each of which deals the configured damage. So their damage is multiplied by 1/3, to match the intended damage per attack.\
However, the Vanilla engine would apply these factors two times, resulting in the Ice Mage dealing only 1/3 of the intended damage per attack.\
So, different builds are required to make the balancing work for both. In the Vanilla build, the square roots of the attack balancing factors are applied, and in the LoA builds, the factors are applied directly.


## Notes

The functionality for gaining experience from the summon's damage is broken in the Siege Engine. Over-simplified, it only works for Combat Magic summons with ranged attacks, e.g. Jade Gargoyle. Which sucks, especially for Nature Mages - and also prohibits using this mod to play a campaign as a "summoner".\
But fear not, I made a fix for it! Have a look at the minimod "no xp limits - fixes summons xp".

LoA features imbued spell books with bonuses for certain spell categories, like for example the Spell Book of Convening which reduces the mana cost of summon spells by 10%. The spells of each category are specified explicitly, which is why they don't work for custom spells.\
But fear not, I made a fix for it! Have a look at the minimod "extended-imbued-spellbook-support".


## Attribution

Made by me with lots of testing support from Estaf, and lots of help from the modders on the Kingdom of Ehb Discord.
