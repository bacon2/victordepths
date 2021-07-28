# important game mechanics
effect give @a[scores={time_here=..1, vcd_oldplayer=1}] resistance 10 5
execute at @a[scores={time_here=..1, vcd_oldplayer=1}] unless block ~ ~ ~ minecraft:nether_portal run fill ~-1 ~-2 ~-1 ~1 ~-1 ~1 dirt destroy
execute at @a[scores={time_here=..1, vcd_oldplayer=1}] unless block ~ ~ ~ minecraft:nether_portal run fill ~-1 ~ ~-1 ~1 ~1 ~1 air destroy
execute at @a[scores={time_here=..1, vcd_oldplayer=1}, nbt={Dimension:"victordepths:the_arena"}] run fill ~-15 ~ ~-15 ~15 ~3 ~15 air destroy
kill @e[tag=spawn_platform]
execute as @a at @s store result score @s track-y run data get entity @s Pos[1]
execute as @a at @s if block ~ ~ ~ ladder if block ~ ~3 ~ ladder run tp @s[x_rotation=100..] ~ ~0.5 ~
execute as @e[type=villager, tag=victorsmith] run function victordepths:victorsmith
execute as @a[nbt={Dimension:"minecraft:overworld"}] at @s if block ~ ~ ~ minecraft:nether_portal run scoreboard players set @s time_here 2
execute as @a[nbt={Dimension:"minecraft:the_nether"}] at @s if block ~ ~ ~ minecraft:nether_portal run scoreboard players set @s time_here 2
execute as @a[nbt={Dimension:"minecraft:overworld"}] at @s if block ~ ~ ~ minecraft:end_portal run scoreboard players set @s time_here 2
execute as @a[nbt={Dimension:"minecraft:overworld"}] at @s if block ~ ~-1 ~ minecraft:end_portal run scoreboard players set @s time_here 2
execute as @a[nbt={Dimension:"minecraft:the_end"}] at @s if block ~ ~ ~ minecraft:end_portal run scoreboard players set @s time_here 2
execute as @a[nbt={Dimension:"minecraft:the_end"}] at @s if block ~ ~-1 ~ minecraft:end_portal run scoreboard players set @s time_here 2
scoreboard players set @a vcd_oldplayer 1
execute as @e[type=potion, nbt={Item:{tag:{nbt:genie}}}] at @s unless block ~ ~-1 ~ #victordepths:fluids run function victordepths:summon_genie
execute at @a as @e[type=wandering_trader, distance=..32, tag=genie] run data modify entity @s Offers.Recipes set from storage victordepths genie
execute as @a at @s if entity @e[type=villager, tag=victorsmith, distance=..10] run advancement grant @s only victordepths:find_victorsmith
# dimensional quirks
execute at @a[nbt={Dimension:"victordepths:the_victordepths"}] as @e[distance=1.., tag=!moved, type=husk] run data modify entity @s ArmorItems set value [{id:"minecraft:netherite_boots", Count:1b},{id:"minecraft:netherite_leggings", Count:1b},{id:"minecraft:netherite_chestplate", Count:1b},{id:"minecraft:jack_o_lantern", Count:1b}]
execute at @a[nbt={Dimension:"victordepths:the_victordepths"}] as @e[distance=1.., tag=!moved, type=husk] run tag @s add moved
execute as @a[nbt={Dimension:"victordepths:the_phantom_zone"}] if predicate victordepths:1_in_70 at @s run summon phantom ^7 ^8 ^9
execute at @a[nbt={Dimension:"victordepths:the_weatherkeep"}] at @e[type=arrow, limit=1, distance=1.., sort=random] run summon minecraft:lightning_bolt
execute at @a[nbt={Dimension:"victordepths:the_weatherkeep"}] as @e[type=wandering_trader, distance=..32] unless data entity @s Tags run data modify entity @s Offers.Recipes set from storage victordepths rainkeeper
execute as @a[nbt={Dimension:"victordepths:the_fluffyfunplace"}] if predicate victordepths:sprinting run effect give @s jump_boost 1 10
execute as @a[nbt={Dimension:"victordepths:the_fluffyfunplace"}] if predicate victordepths:sprinting run effect give @s slow_falling 4 10
execute as @a[nbt={Dimension:"victordepths:the_fluffyfunplace"}] if predicate victordepths:1_in_30 at @s run summon guardian ~ ~-10 ~
execute as @a[nbt={Dimension:"victordepths:the_fluffyfunplace"}] if predicate victordepths:1_in_70 at @s run summon cow ~ ~-10 ~
execute as @a[nbt={Dimension:"victordepths:the_fluffyfunplace"}] if predicate victordepths:1_in_70 at @s run summon minecraft:husk ~ ~-10 ~ {Silent:1b,ArmorItems:[{},{},{},{id:"minecraft:dirt",Count:1b}]}
execute as @a[nbt={Dimension:"victordepths:the_fluffyfunplace"}] if predicate victordepths:1_in_70 at @s run summon minecraft:zombie ~ ~-10 ~ {Silent:1b,ArmorItems:[{},{},{},{id:"minecraft:oak_sapling",Count:1b}]}
execute at @a[nbt={Dimension:"victordepths:the_fluffyfunplace"}] if predicate victordepths:1_in_30 run kill @e[sort=random, type=!player, limit=1]
execute at @a[nbt={Dimension:"victordepths:the_fluffyfunplace"}] as @e[distance=1.., tag=!moved, type=#victordepths:fluffyfunspawns] run function victordepths:move_below
execute as @a[nbt={Dimension:"victordepths:the_arena"}] at @s unless entity @e[type=wither, distance=..60] run function victordepths:arena_1
execute as @a[nbt={Dimension:"victordepths:the_arena"}, scores={kill_wither=1..}] at @s run function victordepths:arena_victory
execute at @a[nbt={Dimension:"victordepths:the_uncharted"}] run execute as @e[distance=0..] at @s if block ~ ~-1 ~ coarse_dirt run tp @s ~ ~-0.1 ~
execute at @a[nbt={Inventory:[{tag:{nbt:rainwalkers},Slot:100b}]}] run fill ~ ~0.1 ~ ~ ~0.1 ~ water[level=15] replace #victordepths:fluids
execute as @a[nbt={Inventory:[{tag:{nbt:dolphinlegs},Slot:101b}]}] at @s run effect give @s minecraft:dolphins_grace 5 0 true
execute at @a[nbt={SelectedItem:{tag:{nbt:"seeking_bow"}}}] run function victordepths:seeking_bow
execute as @a[nbt=!{Dimension:"victordepths:the_underworld"}] at @s if entity @e[type=item, distance=..10, nbt={Item:{tag:{nbt:"soul_coal"}}}] run function victordepths:soul_coal
execute as @a[nbt={Dimension:"victordepths:the_arena", Inventory:[{id:"minecraft:firework_rocket"}]}] at @s run summon minecraft:creeper ~ ~1 ~ {Fuse:0b, ExplosionRadius:1}
execute as @a[nbt={Dimension:"victordepths:the_arena", Inventory:[{id:"minecraft:firework_rocket"}]}] run clear @s minecraft:firework_rocket
execute at @a[nbt={Dimension:"victordepths:the_aweclouds"}] run execute as @e[type=dragon_fireball, distance=0.1..] at @s run function victordepths:throwat_player
execute at @a[nbt={Dimension:"victordepths:the_aweclouds"}] run execute as @e[type=snow_golem, distance=0.1..16] if predicate victordepths:1_in_70 at @s run summon dragon_fireball ~ ~3 ~
execute at @a[nbt={Dimension:"victordepths:the_aweclouds"}] run execute as @e[type=#victordepths:awecloud_team, distance=0.1..100] run data modify entity @s Invulnerable set value 1b
execute at @a[nbt={Dimension:"victordepths:the_aweclouds"}] run execute as @e[type=dragon_fireball, distance=0.1..] at @s run playsound minecraft:entity.elder_guardian.curse master @a
execute at @a[nbt={Dimension:"victordepths:the_aweclouds"}] run execute as @e[type=pig, distance=0.1..100] at @s run summon snow_golem ~ ~ ~
execute at @a[nbt={Dimension:"victordepths:the_aweclouds"}] run kill @e[type=pig, distance=0.1..100]
execute as @a[nbt={Dimension:"victordepths:the_aweclouds"}, scores={vcd_steal=1..}] at @s run playsound minecraft:entity.ghast.hurt master @s ~ ~ ~ 10 0.8
tag @a[nbt={Dimension:"victordepths:the_aweclouds"}, scores={vcd_steal=1..}] add vcd_caught
execute as @a[nbt={Dimension:"victordepths:the_aweclouds"}, scores={vcd_steal=1..}] at @s run advancement grant @s only victordepths:break_awecloud_gold
execute as @a[nbt=!{Dimension:"victordepths:the_aweclouds"}, tag=vcd_caught] at @s run advancement grant @s only victordepths:break_awecloud_gold_and_escape
execute as @a[nbt={Dimension:"victordepths:the_aweclouds"}, scores={vcd_steal=1..}] at @s if predicate victordepths:1_in_30 run function victordepths:into_nether
execute at @e[type=piglin, nbt={HandItems:[{id:"minecraft:raw_gold",tag:{Enchantments:[{}]}}]}] as @p[distance=..10] run advancement grant @s only victordepths:give_heavengold
execute at @e[type=piglin, nbt={HandItems:[{id:"minecraft:raw_gold",tag:{Enchantments:[{}]}}]}] as @p[distance=..10] run function victordepths:into_aweclouds
execute as @a[nbt={Dimension:"victordepths:the_outside"}] at @s run tp @s ^ ^0.05 ^
# dimension order
execute as @a[scores={track-y=255..}, nbt={Dimension:"victordepths:the_victordepths"}] at @s run function victordepths:into_arena
execute as @a[scores={track-y=..3}, nbt={Dimension:"victordepths:the_arena"}] at @s run function victordepths:downto_victordepths
execute as @a[scores={track-y=124..}, nbt={Dimension:"victordepths:the_arena"}] at @s run function victordepths:into_sanctuary
execute as @a[scores={track-y=..3}, nbt={Dimension:"victordepths:the_sanctuary"}] at @s run function victordepths:downto_arena
execute as @a[scores={track-y=124..}, nbt={Dimension:"victordepths:the_sanctuary"}] at @s run function victordepths:into_forebodium
execute as @a[scores={track-y=..3}, nbt={Dimension:"victordepths:the_forebodium"}] at @s run function victordepths:downto_sanctuary
execute as @a[scores={track-y=124..}, nbt={Dimension:"victordepths:the_forebodium"}] at @s run function victordepths:into_fluffyfunplace
execute as @a[scores={track-y=..3}, nbt={Dimension:"victordepths:the_fluffyfunplace"}] at @s run function victordepths:downto_forebodium
execute as @a[scores={track-y=124..}, nbt={Dimension:"victordepths:the_fluffyfunplace"}] at @s run function victordepths:into_nether
execute as @a[scores={track-y=..3}, nbt={Dimension:"minecraft:the_nether"}] at @s run function victordepths:downto_fluffyfunplace
execute as @a[scores={track-y=124..}, nbt={Dimension:"minecraft:the_nether"}] at @s run function victordepths:into_noobtrap
execute as @a[scores={track-y=..3}, nbt={Dimension:"victordepths:the_noobtrap"}] at @s run function victordepths:downto_nether
execute as @a[scores={track-y=124..}, nbt={Dimension:"victordepths:the_noobtrap"}] at @s run function victordepths:into_underworld
execute as @a[scores={track-y=..3}, nbt={Dimension:"victordepths:the_underworld"}] at @s run function victordepths:downto_noobtrap
execute as @a[scores={track-y=124..}, nbt={Dimension:"victordepths:the_underworld"}] at @s run function victordepths:into_overworld
execute as @a[scores={track-y=..3}, nbt={Dimension:"minecraft:overworld"}] at @s run function victordepths:downto_underworld
execute as @a[scores={track-y=255..}, nbt={Dimension:"minecraft:overworld"}] at @s run function victordepths:into_open
execute as @a[scores={track-y=..3}, nbt={Dimension:"victordepths:the_open"}] at @s run function victordepths:downto_overworld
execute as @a[scores={track-y=255..}, nbt={Dimension:"victordepths:the_open"}] at @s run function victordepths:into_weatherkeep
execute as @a[scores={track-y=..3}, nbt={Dimension:"victordepths:the_weatherkeep"}] at @s run function victordepths:downto_open
execute as @a[scores={track-y=127..}, nbt={Dimension:"victordepths:the_weatherkeep"}] at @s run function victordepths:into_phantom_zone
execute as @a[scores={track-y=..70}, nbt={Dimension:"victordepths:the_phantom_zone"}] at @s run function victordepths:downto_weatherkeep
execute as @a[scores={track-y=255..}, nbt={Dimension:"victordepths:the_phantom_zone"}] at @s run function victordepths:into_aweclouds
execute as @a[scores={track-y=..3}, nbt={Dimension:"victordepths:the_aweclouds"}] at @s run function victordepths:downto_phantom_zone
execute as @a[scores={track-y=255..}, nbt={Dimension:"victordepths:the_aweclouds"}] at @s run function victordepths:into_uncharted
execute as @a[scores={track-y=..3}, nbt={Dimension:"victordepths:the_uncharted"}] at @s run function victordepths:downto_aweclouds
# powers
execute as @a[scores={time_here=192000..}, nbt={Dimension:"victordepths:the_forebodium"}] run tag @s add pillager
execute as @a[scores={time_here=192000..}, nbt={Dimension:"victordepths:the_underworld"}] run tag @s add zombie
execute as @a[scores={time_here=192000..}, nbt={Dimension:"victordepths:the_weatherkeep"}] run tag @s add weatherkeeper
execute as @a[scores={time_here=192000..}, nbt={Dimension:"victordepths:the_victordepths"}] run tag @s add victor
execute as @a[scores={time_here=192000..}, nbt={Dimension:"minecraft:the_nether"}] run tag @s add smolderer
execute as @a[scores={time_here=192000..}, nbt={Dimension:"minecraft:the_end"}] run tag @s add ender
execute as @a[scores={time_here=192000..}, nbt={Dimension:"victordepths:the_phantom_zone"}] run tag @s add insomniac
execute as @a[scores={time_here=192000..}, nbt={Dimension:"victordepths:the_noobtrap"}] run tag @s add tunneler
execute as @a[scores={time_here=192000..}, nbt={Dimension:"victordepths:the_aweclouds"}] run tag @s add immortal
execute as @a[scores={time_here=192000..}, nbt={Dimension:"victordepths:the_sanctuary"}] run tag @s add peacekeeper
execute as @a[scores={time_here=192000..}, nbt={Dimension:"victordepths:the_fluffyfunplace"}] run tag @s add fuzzbuddy
team join pillagers @a[tag=pillager]
team leave @a[tag=!pillager, team=pillagers]
team join pillagers @e[type=#victordepths:pillager_team]
execute at @a[team=pillagers, predicate=victordepths:sneaking] unless entity @e[type=evoker_fangs, distance=..3] run function victordepths:evoker_fangs
team join zombies @a[tag=zombie]
team leave @a[tag=!zombie, team=zombies]
team join zombies @e[type=#victordepths:zombie_team]
execute as @a[tag=zombie, scores={vcd_deal_damage=1..}] if entity @e[type=minecraft:villager, distance=..200, nbt=!{HurtTime:0s}] run execute as @e[type=villager, limit=1, nbt=!{HurtTime:0s}] at @s run function victordepths:zombify_villager
scoreboard players reset @a[tag=zombie] vcd_deal_damage
effect give @e[tag=zombie] minecraft:night_vision 20 0 true
execute at @a[tag=weatherkeeper] run execute at @e[type=arrow, distance=10..100, sort=random, limit=1] run summon lightning_bolt
scoreboard players enable @a[tag=weatherkeeper] change_weather
scoreboard players reset @a[tag=!weatherkeeper] change_weather
execute at @a[tag=weatherkeeper, scores={change_weather=1}] run say clearing weather
execute at @a[tag=weatherkeeper, scores={change_weather=1}] run weather clear
execute at @a[tag=weatherkeeper, scores={change_weather=2}] run say making it rain
execute at @a[tag=weatherkeeper, scores={change_weather=2}] run weather rain
execute at @a[tag=weatherkeeper, scores={change_weather=3}] run say making it thunder
execute at @a[tag=weatherkeeper, scores={change_weather=3}] run weather thunder
execute at @a[tag=weatherkeeper, scores={change_weather=4..}] run w @p Set to 1 for clear, 2 for rain, 3 for thunder. Only works in overworld.
execute as @a[tag=weatherkeeper, scores={change_weather=1..}] run scoreboard players reset @s change_weather
execute as @a[tag=weatherkeeper, scores={change_weather=..-1}] run scoreboard players reset @s change_weather
execute as @a[tag=victor, nbt={ActiveEffects:[{Id:5b, Amplifier:6b}]}, scores={vcd_deal_damage=1..}] run effect give @s minecraft:strength 2 7
execute as @a[tag=victor, nbt={ActiveEffects:[{Id:5b, Amplifier:5b}]}, scores={vcd_deal_damage=1..}] run effect give @s minecraft:strength 2 6
execute as @a[tag=victor, nbt={ActiveEffects:[{Id:5b, Amplifier:4b}]}, scores={vcd_deal_damage=1..}] run effect give @s minecraft:strength 2 5
execute as @a[tag=victor, nbt={ActiveEffects:[{Id:5b, Amplifier:3b}]}, scores={vcd_deal_damage=1..}] run effect give @s minecraft:strength 2 4
execute as @a[tag=victor, nbt={ActiveEffects:[{Id:5b, Amplifier:2b}]}, scores={vcd_deal_damage=1..}] run effect give @s minecraft:strength 2 3
execute as @a[tag=victor, nbt={ActiveEffects:[{Id:5b, Amplifier:1b}]}, scores={vcd_deal_damage=1..}] run effect give @s minecraft:strength 2 2
execute as @a[tag=victor, nbt={ActiveEffects:[{Id:5b}]}, scores={vcd_deal_damage=1..}] run effect give @s minecraft:strength 2 1
execute as @a[tag=victor, scores={vcd_deal_damage=1..}] run effect give @s minecraft:strength 2 0
scoreboard players reset @a[tag=victor] vcd_deal_damage
execute as @a[tag=victor, nbt={ActiveEffects:[{Id:11b, Amplifier:2b}]}, scores={vcd_take_damage=1..}] run effect give @s minecraft:resistance 2 3
execute as @a[tag=victor, nbt={ActiveEffects:[{Id:11b, Amplifier:1b}]}, scores={vcd_take_damage=1..}] run effect give @s minecraft:resistance 2 2
execute as @a[tag=victor, nbt={ActiveEffects:[{Id:11b}]}, scores={vcd_take_damage=1..}] run effect give @s minecraft:resistance 2 1
execute as @a[tag=victor, scores={vcd_take_damage=1..}] run effect give @s minecraft:resistance 2 0
scoreboard players reset @a[tag=victor] vcd_take_damage
execute at @a[tag=smolderer] run particle smoke ~ ~2 ~ 0.2 0 0.2 0.001 1 force
effect give @a[tag=smolderer] fire_resistance 10 0 true
execute at @a[tag=smolderer, scores={vcd_take_damage=1..}] run execute as @e[distance=..7] run data modify entity @s Fire set value 50
execute at @a[tag=smolderer, scores={vcd_take_damage=1..}] run particle minecraft:flame ~ ~0.5 ~ 0 1 0 0.1 100 normal
scoreboard players reset @a[tag=smolderer] vcd_take_damage
execute as @a[tag=ender, scores={vcd_take_damage=1..}] at @s run function victordepths:ender
execute as @a[tag=ender] at @s if entity @e[type=#minecraft:impact_projectiles, distance=..7, nbt=!{inGround:1b}, nbt=!{Trident:{tag:{Enchantments:[{id:"minecraft:loyalty"}]}}}] run function victordepths:ender
scoreboard players reset @a[tag=ender] vcd_take_damage
execute as @e[type=phantom] at @s if entity @a[tag=insomniac, distance=..3] unless entity @a[tag=insomniac, nbt={SelectedItem:{id:"minecraft:bow"}}] if block ^ ^ ^0.3 #victordepths:fluids run tp @s ^ ^ ^0.3
execute as @e[type=phantom] at @s if entity @a[tag=insomniac, distance=..3] unless block ^ ^-0.2 ^ #victordepths:fluids run tp @s ^ ^0.2 ^
execute as @e[type=phantom] at @s if entity @a[tag=insomniac, distance=..5] run data modify entity @s Rotation set from entity @a[tag=insomniac, sort=nearest, limit=1] Rotation
execute at @a[tag=insomniac, predicate=victordepths:sneaking] unless entity @e[tag=dragon, distance=..10] run summon minecraft:phantom ~ ~ ~ {Passengers:[{id:"minecraft:minecart"}], Size:10, NoAI:1b, Tags:["dragon"]}
effect give @a[tag=insomniac] slow_falling 1 0 true
effect give @a[tag=insomniac] night_vision 20 0 true
execute as @e[tag=dragon] at @s if entity @e[tag=!insomniac, distance=0.1..4, type=!#victordepths:inanimate] run effect give @e[tag=!insomniac, distance=0.1..4] minecraft:instant_damage 1 10 true
execute as @e[tag=dragon] at @s if entity @e[tag=!insomniac, distance=0.1..4, type=!#victordepths:inanimate] run effect give @e[tag=!insomniac, distance=0.1..4] minecraft:instant_health 1 10 true
execute as @e[tag=dragon] at @s if entity @e[tag=!insomniac, distance=0.1..4, type=!#victordepths:inanimate] run playsound minecraft:entity.phantom.bite master @a ~ ~ ~ 20
execute at @a[tag=tunneler, predicate=victordepths:sneaking] run fill ~-2 ~-2 ~-2 ~2 ~2 ~2 glass replace lava
effect give @a[tag=tunneler] haste 20 2 true
effect give @a[tag=tunneler] speed 20 3 true
effect give @a[tag=tunneler] night_vision 20 2 true
execute as @a[tag=immortal] at @s run spawnpoint @s ~ ~ ~
execute at @a[tag=peacekeeper] run effect give @e[distance=1..50] weakness 1 0 false
execute at @a[tag=peacekeeper] run kill @e[type=#minecraft:impact_projectiles, distance=..50]
execute as @a[tag=fuzzbuddy] at @s if block ~ ~-1 ~ purple_wool run effect give @s minecraft:regeneration 1 9
execute as @a[tag=fuzzbuddy] at @s if block ~ ~-1 ~ purple_wool run effect give @s minecraft:speed 1 9
execute at @a[tag=fuzzbuddy, predicate=victordepths:sneaking] run fill ~ ~-1 ~ ~ ~-1 ~ purple_wool replace #victordepths:fluids
# genie wishes
tag @a[nbt={Inventory:[{tag:{nbt:"gas_token"}}]}] add gassy 
clear @a[nbt={Inventory:[{tag:{nbt:"gas_token"}}]}] firework_star{nbt:"gas_token"}
tag @a[nbt={Inventory:[{tag:{nbt:"tp_token"}}]}] add vcd_tp_power 
clear @a[nbt={Inventory:[{tag:{nbt:"tp_token"}}]}] firework_star{nbt:"tp_token"}
tag @a[nbt={Inventory:[{tag:{nbt:"spectator_token"}}]}] add vcd_spectator 
clear @a[nbt={Inventory:[{tag:{nbt:"spectator_token"}}]}] firework_star{nbt:"spectator_token"}
tag @a[nbt={Inventory:[{tag:{nbt:"skeleton_token"}}]}] add skeleton_free 
clear @a[nbt={Inventory:[{tag:{nbt:"skeleton_token"}}]}] firework_star{nbt:"skeleton_token"}
tag @a[nbt={Inventory:[{tag:{nbt:"phantom_token"}}]}] add phantom_free 
clear @a[nbt={Inventory:[{tag:{nbt:"phantom_token"}}]}] firework_star{nbt:"phantom_token"}
tag @a[nbt={Inventory:[{tag:{nbt:"stone_token"}}]}] add stone_free 
clear @a[nbt={Inventory:[{tag:{nbt:"stone_token"}}]}] firework_star{nbt:"stone_token"}
give @a[nbt={Inventory:[{tag:{nbt:"wealth_token"}}]}] netherite_block 5
give @a[nbt={Inventory:[{tag:{nbt:"wealth_token"}}]}] diamond_block 55
clear @a[nbt={Inventory:[{tag:{nbt:"wealth_token"}}]}] firework_star{nbt:"wealth_token"}
tag @a[nbt={Inventory:[{tag:{nbt:"health_token"}}]}] add vcd_healthy 
clear @a[nbt={Inventory:[{tag:{nbt:"health_token"}}]}] firework_star{nbt:"health_token"}
tag @a[nbt={Inventory:[{tag:{nbt:"speed_token"}}]}] add vcd_speedy 
clear @a[nbt={Inventory:[{tag:{nbt:"speed_token"}}]}] firework_star{nbt:"speed_token"}
execute at @a[tag=gassy, predicate=victordepths:sneaking] run playsound minecraft:entity.bee.hurt master @a ~ ~ ~ 100 0.9
execute at @a[tag=gassy, predicate=victordepths:sneaking] run playsound minecraft:entity.bee.hurt master @a ~ ~ ~ 50 0.6
execute at @a[tag=gassy, predicate=victordepths:sneaking] run particle minecraft:sneeze ^ ^-0.1 ^-3 0.5 0.5 0.5 0 10 force
execute at @a[tag=gassy, predicate=victordepths:sneaking] run playsound minecraft:entity.spider.step master @a ~ ~ ~ 100 0.5
scoreboard players enable @a[tag=vcd_tp_power] warp_to
execute as @a[scores={warp_to=1..}] at @s run function victordepths:warp
execute as @a[scores={warp_to=..-1}] at @s run function victordepths:warp
execute at @a[tag=vcd_spectator, predicate=victordepths:sprinting, gamemode=survival] run playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1 1.8
effect give @a[tag=vcd_spectator, predicate=victordepths:sprinting, gamemode=survival] minecraft:glowing 10 123
gamemode spectator @a[tag=vcd_spectator, nbt={ActiveEffects:[{Id:24b,Amplifier:123b}]}]
gamemode survival @a[tag=vcd_spectator, gamemode=spectator, nbt=!{ActiveEffects:[{Id:24b,Amplifier:123b}]}]
execute at @a[tag=skeleton_free] at @e[type=skeleton, distance=..32] run playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1 1.8
execute at @a[tag=skeleton_free] run kill @e[type=skeleton, distance=..32]
execute at @a[tag=phantom_free] at @e[type=phantom, distance=..32] run playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1 1.8
execute at @a[tag=phantom_free] run kill @e[type=phantom, distance=..32]
execute at @a[tag=stone_free] run fill ~-7 ~-7 ~-7 ~7 ~7 ~7 air replace stone
execute as @a[tag=vcd_healthy] run attribute @s minecraft:generic.max_health base set 40.0
execute as @a[tag=vcd_speedy, predicate=victordepths:sprinting] at @s run function victordepths:start_speedy
execute as @a[tag=vcd_speedy, predicate=!victordepths:sprinting, tag=vcd_speeding] at @s run function victordepths:stop_speedy