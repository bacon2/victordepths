particle minecraft:soul ~ ~ ~ 1 1 1 1 100 normal
effect give @p[distance=..10, nbt=!{Dimension:"victordepths:the_underworld"}] minecraft:resistance 1 4 true
kill @e[type=item, limit=1, sort=nearest, nbt={Item:{tag:{nbt:"soul_coal"}}}]