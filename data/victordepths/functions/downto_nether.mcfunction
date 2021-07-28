execute in minecraft:the_nether run tp @s ~ 115 ~
execute in minecraft:the_nether run summon armor_stand ~ 115 ~ {Tags:["spawn_platform"]}
scoreboard players reset @s track-y
advancement grant @s only victordepths:the_nether
scoreboard players reset @s time_here