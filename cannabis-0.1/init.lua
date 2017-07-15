--aliases
minetest.get_modpath("cannabis")
minetest.register_alias("canapa","cannabis:canapa")

--register node


minetest.register_node("cannabis:hp_block_canapa", 
    {
	description = "hp_block_canapa",
	tiles = {"hp_block_canapa.png"},
	is_ground_content = false,
	groups = {choppy = 30, oddly_breakable_by_hand = 1, flammable = 3, wood = 1},
	sounds = "cannabis:cannabis_canapa_s2",
})

minetest.register_node("cannabis:canapa", {
	description = "Canapa",
	drawtype = "plantlike",
	tiles = {"cannabis_canapa.png"},
	inventory_image = "cannabis_canapa.png",
	wield_image = "cannabis_canapa.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	groups = {snappy = 3, flammable = 2},
	sounds = "cannabis_canapa_s",
        drop = {
   max_items = 2,
   items = {
      {items = {"cannabis:canapa"}, rarity = 1 },
      {items = {"cannabis:canapa_leaves"}, rarity = 1 },
   }
},
	after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end,
})

--function

function minetest.grow_canapa(pos, node)
	pos.y = pos.y - 1
	local name = minetest.get_node(pos).name
	if name ~= "default:dirt_with_grass" and name ~= "default:dirt" then
		return
	end
	if not minetest.find_node_near(pos, 3, {"group:water"}) then
		return
	end
	pos.y = pos.y + 1
	local height = 0
	while node.name == "cannabis:canapa" and height < 4 do
		height = height + 1
		pos.y = pos.y + 1
		node = minetest.get_node(pos)
	end
	if height == 4 or node.name ~= "air" then
		return
	end
	minetest.set_node(pos, {name = "cannabis:canapa"})
	return true
end

minetest.register_abm({
	nodenames = {"cannabis:canapa"},
	neighbors = {"default:dirt", "default:dirt_with_grass", "default:sand"},
	interval = 50,
	chance = 20,
	action = function(...)
		minetest.grow_canapa(...)
	end
})

--craft item :fiber, fuel, plastic, paper,flower,oil,flour,bred,raisin,seed,leaves

minetest.register_craftitem("cannabis:canapa_fiber", {
	description = "Fiber",
	inventory_image = "cannabis_canapa_fiber.png",
})
minetest.register_craftitem("cannabis:canapa_fuel", {
	description = "Fuel",
	inventory_image = "cannabis_fuel.png",
})

minetest.register_craftitem("cannabis:canapa_plastic", {
	description = "Plastic",
	inventory_image = "cannabis_plastic.png",
})

minetest.register_craftitem("cannabis:canapa_paper", {
	description = "Paper",
	inventory_image = "cannabis_paper.png",
})
minetest.register_craftitem("cannabis:canapa_flour", {
	description = "Flour",
	inventory_image = "cannabis_canapa_flour.png",
})

minetest.register_craftitem("cannabis:canapa_bread", {
	description = "Bread",
	inventory_image = "cannabis_canapa_bread.png",
	on_use = minetest.item_eat(10),
})

minetest.register_craftitem("cannabis:canapa_seed", {
	description = "Hemp_Seed",
	inventory_image = "cannabis_canapa_seed.png",
	on_use = minetest.item_eat(10),
})

minetest.register_craftitem("cannabis:canapa_leaves", {
	description = "Hemp_Leaves",
	inventory_image = "cannabis_canapa_leaves.png",
	on_use = minetest.item_eat(5),
})

minetest.register_craftitem("cannabis:canapa_flower", {
	description = "Hemp_Flower",
	inventory_image = "cannabis_canapa_flower.png",
	on_use = minetest.item_eat(5),
})

minetest.register_craftitem("cannabis:canapa_raisin", {
	description = "Hemp_Raisin",
	inventory_image = "cannabis_canapa_raisin.png",
	on_use = minetest.item_eat(5),
})

minetest.register_craftitem("cannabis:canapa_oil", {
	description = "Hemp_Oil",
	inventory_image = "cannabis_canapa_oil.png",
	on_use = minetest.item_eat(5),
})

minetest.register_craftitem("cannabis:canapa_glue", {
	description = "Hemp_Glue",
	inventory_image = "cannabis_canapa_glue.png",
	on_use = minetest.item_eat(1),
})

--crafting

minetest.register_craft({
	output = 'cannabis:canapa_oil 4 ',
	recipe = {
		{"","",""},
                {"","",""},
                {"cannabis:canapa_flower","cannabis:canapa_raisin","cannabis:canapa_flower"},
	}
})

minetest.register_craft({
	output = 'cannabis:canapa_fuel 4 ',
	recipe ={ 
        {"cannabis:canapa","cannabis:canapa",""},    
        {"cannabis:canapa","cannabis:canapa",""},
        {"cannabis:canapa","cannabis:canapa",""},
        }
})

minetest.register_craft({
	output = 'cannabis:canapa_plastic 8 ',
	recipe ={ 
        {"cannabis:canapa","cannabis:canapa","cannabis:canapa"},
        {"cannabis:canapa","cannabis:canapa","cannabis:canapa"},
        }
})


          minetest.register_craft({
	output = 'cannabis:canapa_glue 10 ',
	recipe = {
		{"cannabis:canapa_plastic","cannabis:canapa_raisin","cannabis:canapa_plastic"},
                {"cannabis:canapa_raisin","cannabis:canapa_oil","cannabis:canapa_raisin"},
                {"cannabis:canapa_plastic","cannabis:canapa_raisin","cannabis:canapa_plastic"},
	}
})
  
          minetest.register_craft({
	output = 'cannabis:hp_block_canapa 4 ',
	recipe = {
		{"cannabis:canapa_fiber","cannabis:canapa_glue","cannabis:canapa_fiber"},
                {"cannabis:canapa_glue","cannabis:canapa_fiber","cannabis:canapa_glue"},
                {"cannabis:canapa_fiber","cannabis:canapa_glue","cannabis:canapa_fiber"},
	}
})

  
        minetest.register_craft({
	output = 'cannabis:canapa_raisin 3 ',
	recipe = {
		{"","",""},
                {"","",""},
                {"cannabis:canapa_flower","cannabis:canapa_flower",""},
	}
})
        

minetest.register_craft({
	output = 'cannabis:canapa_flower 5 ',
	recipe = {
		{"","",""},
                {"","",""},
                {"cannabis:canapa_leaves","cannabis:canapa_leaves",""},
	}
})


minetest.register_craft({
	output = 'cannabis:canapa_seed 10 ',
	recipe = {
		{"cannabis:canapa","",""},
                {"","cannabis:canapa",""},
                {"","","cannabis:canapa"},
	}
})


minetest.register_craft({
	output = 'cannabis:canapa_fiber 10 ',
	recipe = {
		{"","","cannabis:canapa"},
                {"","cannabis:canapa",""},
                {"cannabis:canapa","",""},
	}
})

minetest.register_craft({
	output = 'cannabis:canapa_paper 6 ',
	recipe = {
		{'cannabis:canapa', 'cannabis:canapa', 'cannabis:canapa'
                },
	}
})

minetest.register_craft({
	type = "fuel",        
	recipe = "cannabis:canapa",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",        
	recipe = "cannabis:canapa_fuel",
	burntime = 25,
})



minetest.register_craft({
	type = "shapeless",
	output = "cannabis:canapa_flour 4",
	recipe = {"cannabis:canapa_seed", "cannabis:canapa_seed", "cannabis:canapa_seed", "cannabis:canapa_seed"}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "cannabis:canapa_bread",
	recipe = "cannabis:canapa_flour"
})
--mapgen

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 8,
		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 100, y = 100, z = 100},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
		y_min = 1,
		y_max = 1,
		decoration = "cannabis:canapa",
		height = 2,
		height_max = 7, 
		spawn_by = "default:water_source",
		num_spawn_by = 1,
	})


	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt"},
		sidelen = 16,
		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 200, y = 200, z = 200},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
		biomes = {"savanna_swamp"},
		y_min = 0,
		y_max = 0,
		schematic = minetest.get_modpath("default").."/schematics/papyrus.mts",
	})
        --armor
        
        if minetest.get_modpath("cannabis") then
	local stats = {
		fibra = { name="fibra", armor=1.8, heal=0, use=650 },
                tessuto= { name="tessuto", armor=2.5, heal=8, use=200 },
		foglie = { name="foglie", armor=2.7, heal=10, use=100 },
		high = { name="high_performance", armor=2.7, heal=10, use=75 },
	}
	local mats = {
		fibra="cannabis:fibra_ingot",
		tessuto="cannabis:tessuto_ingot",
		foglie="cannabis:foglie_ingot",
		high="cannabis:high_performance_ingot",
	}
	for k, v in pairs(stats) do
		minetest.register_tool("cannabis:helmet_"..k, {
			description = v.name.." Helmet",
			inventory_image = "cannabis_armor_inv_helmet_"..k..".png",
			groups = {armor_head=math.floor(5*v.armor), armor_heal=v.heal, armor_use=v.use},
			wear = 0,
		})
		minetest.register_tool("cannabis:chestplate_"..k, {
			description = v.name.." Chestplate",
			inventory_image = "cannabis_armor_inv_chestplate_"..k..".png",
			groups = {armor_torso=math.floor(8*v.armor), armor_heal=v.heal, armor_use=v.use},
			wear = 0,
		})
		minetest.register_tool("cannabis:leggings_"..k, {
			description = v.name.." Leggings",
			inventory_image = "cannabis_armor_inv_leggings_"..k..".png",
			groups = {armor_legs=math.floor(7*v.armor), armor_heal=v.heal, armor_use=v.use},
			wear = 0,
		})
		minetest.register_tool("cannabis:boots_"..k, {
			description = v.name.." Boots",
			inventory_image = "cannabis_armor_inv_boots_"..k..".png",
			groups = {armor_feet=math.floor(4*v.armor), armor_heal=v.heal, armor_use=v.use},
			wear = 0,
		})
	end

	for k, v in pairs(mats) do
		minetest.register_craft({
			output = "cannabis:helmet_"..k,
			recipe = {
				{v, v, v},
				{v, "", v},
				{"", "", ""},
			},
		})
		minetest.register_craft({
			output = "cannabis:chestplate_"..k,
			recipe = {
				{v, "", v},
				{v, v, v},
				{v, v, v},
			},
		})
		minetest.register_craft({
			output = "cannabis:leggings_"..k,
			recipe = {
				{v, v, v},
				{v, "", v},
				{v, "", v},
			},
		})
		minetest.register_craft({
			output = "cannabis:boots_"..k,
			recipe = {
				{v, "", v},
				{v, "", v},
			},
		})
	end
            	if minetest.get_modpath("shields") then
		for k, v in pairs(stats) do
			minetest.register_tool("cannabis:shield_"..k, {
				description = v.name.." hemp Shield",
				inventory_image = "cannabis_armor_inv_shield_"..k..".png",
				groups = {armor_shield=math.floor(5*v.armor), armor_heal=v.heal, armor_use=v.use},
				wear = 0,
			})
			local m = mats[k]
			minetest.register_craft({
				output = "cannabis:shield_"..k,
				recipe = {
					{m, m, m},
					{m, m, m},
					{"", m, ""},
				},
			})
		end
	end
end

minetest.register_craftitem("cannabis:mixed_hr_ingot", {
	description = ("Mixed HR Ingot"),
	inventory_image = "cannabis_mixed_hr_ingot.png",
})

minetest.register_craftitem(":cannabis:fibra_ingot", {
	description = ("fibra Ingot"),
	inventory_image = "cannabis_fibra_ingot.png",
})
minetest.register_craftitem(":cannabis:foglie_ingot", {
	description = ("foglie Ingot"),
	inventory_image = "cannabis_foglie_ingot.png",
})
minetest.register_craftitem("cannabis:high_performance_ingot", {
	description = ("High Performance Ingot"),
	inventory_image = "cannabis_high_performance_ingot.png",
})
minetest.register_craftitem(":cannabis:tessuto_ingot", {
	description = ("Tessuto Ingot"),
	inventory_image = "cannabis_tessuto_ingot.png",
})
local function for_each_registered_item(action)
	local already_reg = {}
	for k, _ in pairs(minetest.registered_items) do
		table.insert(already_reg, k)
	end
	local really_register_craftitem = minetest.register_craftitem
	minetest.register_craftitem = function(name, def)
		really_register_craftitem(name, def)
		action(string.gsub(name, "^:", ""))
	end
	local really_register_tool = minetest.register_tool
	minetest.register_tool = function(name, def)
		really_register_tool(name, def)
		action(string.gsub(name, "^:", ""))
	end
	local really_register_node = minetest.register_node
	minetest.register_node = function(name, def)
		really_register_node(name, def)
		action(string.gsub(name, "^:", ""))
	end
	for _, name in ipairs(already_reg) do
		action(name)
	end
end

local function register_block(block, ingot)
	minetest.register_craft({
		output = block,
		recipe = {
			{ingot, ingot, ingot},
			{ingot, ingot, ingot},
			{ingot, ingot, ingot},
		}
	})

	minetest.register_craft({
		output = ingot.." 9",
		recipe = {
			{block}
		}
	})
end

register_block("cannabis:cannabis_fibra_block", "cannabis:fibra_ingot")
register_block("cannabis:cannabis_high_performance_block", "cannabis:high_performance_ingot")
register_block("cannabis:cannabis_tessuto_block", "cannabis:tessuto_ingot")
register_block("cannabis:cannabis_foglie_block", "cannabis:foglie_ingot")

minetest.register_node("cannabis:cannabis_foglie_block", {
	description = ("Foglie Block"),
	tiles = { "cannabis_foglie_block.png" },
	is_ground_content = true,
	groups = {cracky=1, level=2},
	sounds = "cannabis:cannabis_canapa_s3"
})

minetest.register_node("cannabis:cannabis_tessuto_block", {
	description = ("Tessuto Block"),
	tiles = { "cannabis_tessuto_block.png" },
	is_ground_content = true,
	groups = {cracky=1, level=2},
	sounds = "cannabis_canapa_s3"
})


minetest.register_node("cannabis:cannabis_high_performance_block", {
	description = ("High Performance Block"),
	tiles = { "cannabis_high_performance_block.png" },
	is_ground_content = true,
	groups = {cracky=1, level=2},
	sounds = "cannabis_canapa_s3"
})
minetest.register_node("cannabis:cannabis_fibra_block", {
	description = ("Fibra Block"),
	tiles = { "cannabis_fibra_block.png" },
	is_ground_content = true,
	groups = {cracky=1, level=2},
	sounds = "cannabis_canapa_s3"
})

minetest.register_craft({
	type = 'cooking',
	recipe = "cannabis:canapa_fiber",
	output = "cannabis:fibra_ingot",
})


minetest.register_craft({
	type = 'cooking',
	recipe = "cannabis:canapa_leaves",
	output = "cannabis:foglie_ingot",
})

minetest.register_craft({
	type = 'cooking',
	recipe = "cannabis:canapa_paper",
	output = "cannabis:tessuto_ingot",
})

minetest.register_craft({
	type = 'cooking',
	recipe = "cannabis:canapa_plastic",
	cooktime = 2,
	output = "cannabis:high_performance_ingot",
})

local function for_each_registered_item(action)
	local already_reg = {}
	for k, _ in pairs(minetest.registered_items) do
		table.insert(already_reg, k)
	end
	local really_register_craftitem = minetest.register_craftitem
	minetest.register_craftitem = function(name, def)
		really_register_craftitem(name, def)
		action(string.gsub(name, "^:", ""))
	end
	local really_register_tool = minetest.register_tool
	minetest.register_tool = function(name, def)
		really_register_tool(name, def)
		action(string.gsub(name, "^:", ""))
	end
	local really_register_node = minetest.register_node
	minetest.register_node = function(name, def)
		really_register_node(name, def)
		action(string.gsub(name, "^:", ""))
	end
	for _, name in ipairs(already_reg) do
		action(name)
	end
end

-- This file supplies hemp for the plantlife modpack
-- Last revision:  2016-01-14





minetest.register_node('cannabis:seedling', {
	description = ("hemp (seedling)"),
	drawtype = 'plantlike',
	waving = 1,
	tiles = { '1hemp_seedling.png' },
	inventory_image = '1hemp_seedling.png',
	wield_image = '1hemp_seedling.png',
	sunlight_propagates = true,
	paramtype = 'light',
	walkable = false,
	groups = { snappy = 3, poisonivy=1, flora_block=1 },
	sounds = "cannabis_canapa_s3",
	buildable_to = true,
})

minetest.register_node('cannabis:sproutling', {
	description = ("hemp (sproutling)"),
	drawtype = 'plantlike',
	waving = 1,
	tiles = { 'hemp_sproutling.png' },
	inventory_image = 'hemp_sproutling.png',
	wield_image = 'hemp_sproutling.png',
	sunlight_propagates = true,
	paramtype = 'light',
	walkable = false,
	groups = { snappy = 3, poisonivy=1, flora_block=1 },
	sounds = "cannabis_canapa_s3",
	buildable_to = true,
})

minetest.register_node('cannabis:climbing', {
	description = ("hemp (climbing plant)"),
	drawtype = 'signlike',
	tiles = { 'hemp_climbing.png' },
	inventory_image = 'hemp_climbing.png',
	wield_image = 'hemp_climbing.png',
	sunlight_propagates = true,
	paramtype = 'light',
	paramtype2 = 'wallmounted',
	walkable = false,
	groups = { snappy = 3, poisonivy=1, flora_block=1 },
	sounds = "cannabis_canapa_s3",
	selection_box = {
		type = "wallmounted",
		--wall_side = = <default>
	},
	buildable_to = true,
})
minetest.register_craft({
	type = "shapeless",
	output = "cannabis:climbing 30",
	recipe = {"cannabis:cannabis_foglie_block", "cannabis:cannabis_foglie_block", "cannabis:cannabis_foglie_block"}
})

minetest.register_craft({
	type = "shapeless",
	output = "cannabis:mixed_hr_ingot 3",
	recipe = {"cannabis:fibra_ingot", "cannabis:foglie_ingot", "cannabis:tessuto_ingot"}
})
