class InventoryShoppingsController < ApplicationController
  def index
    recent_shopping = ShoppingList.last
    recipe_foods = recent_shopping.recipe.recipe_foods.includes(:food)
    inventory_foods = recent_shopping.inventory.inventory_foods.includes(:food)
    @inventory = recent_shopping.inventory
    @recipe = recent_shopping.recipe

    @shopping_list_items = generate_shopping_items(recipe_foods, inventory_foods)
    @total_cost = total(@shopping_list_items)
  end

  private

  def generate_shopping_items(recipe_foods, inventory_foods)
    inventory_food_hash = {}
    final_shooping_list = {}

    inventory_foods.each do |inventory_food|
      food_name = inventory_food.food.name
      inventory_food_hash[food_name.to_s] = inventory_food.quantity
    end

    recipe_foods.each do |recipe_food|
      food = recipe_food.food
      key = food.name
      quantity = recipe_food.quantity

      available_quantity = inventory_food_hash[key.to_s]

      if available_quantity.nil?
        final_shooping_list[key.to_s] = [quantity, food.measurement_unit, quantity * food.price.to_f]
      else
        dif = available_quantity - quantity
        final_shooping_list[key.to_s] = [-1 * dif, food.measurement_unit, -1 * dif * food.price.to_f] if dif.negative?
      end
    end

    final_shooping_list
  end

  def total(shopping_list)
    count = 0
    shopping_list.each_value do |value|
      count += value[2]
    end
    count
  end
end
