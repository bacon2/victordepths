execute in victordepths:the_open run tp @s ~ 128 ~
execute in victordepths:the_open run summon armor_stand ~ 128 ~ {Tags:["spawn_platform"]}
scoreboard players reset @s track-y
advancement grant @s only victordepths:the_open
scoreboard players reset @s time_here