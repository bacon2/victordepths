execute in minecraft:the_nether run tp @s ~ 5 ~
execute in minecraft:the_nether run summon armor_stand ~ 5 ~ {Tags:["spawn_platform"]}
scoreboard players reset @s track-y
scoreboard players reset @s time_here
scoreboard players reset @s vcd_steal
tag @s remove vcd_caught