playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1 1.8
effect clear @e minecraft:jump_boost
effect clear @e minecraft:slowness
execute as @e[type=#minecraft:impact_projectiles, distance=..64] run data modify entity @s NoGravity set value 0b
execute as @e[type=#minecraft:impact_projectiles, distance=..32] run function victordepths:project
tag @s remove vcd_speeding