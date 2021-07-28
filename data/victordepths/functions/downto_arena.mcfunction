scoreboard players reset @s kill_wither
execute in victordepths:the_arena run tp @s ~ 115 ~
execute in victordepths:the_arena run summon armor_stand ~ 115 ~ {Tags:["spawn_platform"]}
scoreboard players reset @s track-y
function victordepths:arena_1
advancement grant @s only victordepths:the_arena
scoreboard players reset @s time_here