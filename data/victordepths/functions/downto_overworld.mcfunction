execute in minecraft:overworld run tp @s ~ 250 ~
execute in minecraft:overworld run summon armor_stand ~ 250 ~ {Tags:["spawn_platform"]}
scoreboard players reset @s track-y
scoreboard players reset @s time_here