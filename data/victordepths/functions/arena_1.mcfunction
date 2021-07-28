execute in victordepths:the_arena at @a[distance=1..] unless entity @e[type=wither, limit=1, distance=..60] run summon wither ~10 ~ ~
attribute @e[type=wither, limit=1, sort=nearest] minecraft:generic.follow_range base set 300
spreadplayers ~ ~ 1 50 under 100 false @e[type=wither]