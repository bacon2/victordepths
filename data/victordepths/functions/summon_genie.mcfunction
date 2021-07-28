summon minecraft:wandering_trader ~ ~ ~ {Tags:[genie], Invulnerable:1b}
summon minecraft:axolotl ~ ~ ~ {Tags:[genie_pet], Invulnerable:1b}
summon minecraft:panda ~ ~ ~ {Tags:[genie_pet], Invulnerable:1b}
summon minecraft:trader_llama ~ ~ ~ {Tags:[genie_pet], Invulnerable:1b}
summon minecraft:villager ~ ~ ~ {Tags:[genie_pet], Invulnerable:1b, PersistenceRequired:0b}
summon minecraft:bat ~ ~ ~ {Tags:[genie_pet], Invulnerable:1b}
summon minecraft:strider ~ ~ ~ {Tags:[genie_pet], Invulnerable:1b}
summon minecraft:enderman ~ ~ ~ {Tags:[genie_pet], Invulnerable:1b}
summon minecraft:vex ~ ~ ~ {Tags:[genie_pet], Invulnerable:1b}
summon minecraft:area_effect_cloud ~ ~-1 ~ {Particle:"minecraft:sweep_attack", Duration:20, Radius:10, Potion:"minecraft:long_invisibility"}
execute as @e[distance=..7, tag=genie_pet] run data modify entity @s Leash.UUID set from entity @e[tag=genie, limit=1, sort=nearest] UUID
playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1 1.8
team join genie @e[tag=genie]
team join genie @e[tag=genie_pet]
team join genie @a
give @a[distance=..10] firework_star{nbt:first_wish, display:{Name:'{"text":"First Wish","italic":"false"}'}}
give @a[distance=..10] firework_star{nbt:second_wish, display:{Name:'{"text":"Second Wish","italic":"false"}'}}
give @a[distance=..10] firework_star{nbt:third_wish, display:{Name:'{"text":"Third Wish","italic":"false"}'}}
advancement grant @a[distance=..10] only victordepths:genie
kill @s[type=potion]