tag @e[limit=1, sort=nearest, distance=1.., type=!#victordepths:inanimate] add target
effect give @e[tag=target] glowing 1
execute as @e[tag=target] at @s if entity @e[tag=target, distance=0.1..] run tag @s remove target
execute as @e[type=arrow, nbt=!{inGround:1b}] at @s facing entity @e[tag=target, limit=1, sort=nearest] eyes unless entity @e[tag=target, distance=..7] run tp @s ^ ^ ^1
execute as @e[type=arrow, nbt=!{inGround:1b}] at @s facing entity @e[tag=target, limit=1, sort=nearest] eyes unless entity @e[tag=target, distance=..3] run tp @s ^ ^ ^1
execute as @e[type=arrow, nbt=!{inGround:1b}] at @s facing entity @e[tag=target, limit=1, sort=nearest] feet unless entity @e[tag=target, distance=..0.1] run tp @s ^ ^ ^0.1