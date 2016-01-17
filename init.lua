--aliases

minetest.register_alias("canapa","cannabis:canapa")

--register node


minetest.register_node("cannabis:hp_block_canapa", 
    {
	description = "hp_block_canapa",
	tiles = {"hp_block_canapa.png"},
	is_ground_content = false,
	groups = {choppy = 20, oddly_breakable_by_hand = 1, flammable = 3, wood = 1},
	sounds = "cannabis_canapa_s",
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
        drop = "cannabis:canapa_leaves",
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
