class InventoryFoodsController < ApplicationController
  before_action :set_inventory_food, only: %i[ show destroy ]

  def index
    @inventory_foods = InventoryFood.all
  end

  def show
  end

  def new
    @all_foods = Food.all
    @inventory_food = InventoryFood.new
  end

  def edit
  end

  # POST /inventory_foods or /inventory_foods.json
  def create
    @inventory_food = InventoryFood.new(inventory_food_params)
    inventory_id = params[:inventory_id]
    @inventory_food.inventory_id = inventory_id

    respond_to do |format|
      if @inventory_food.save
        format.html { redirect_to inventory_url(inventory_id), notice: "Inventory food was successfully created." }

      else
        format.html { render :new, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /inventory_foods/1 or /inventory_foods/1.json
  def update
    respond_to do |format|
      if @inventory_food.update(inventory_food_params)
        format.html { redirect_to inventory_food_url(@inventory_food), notice: "Inventory food was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_foods/1 or /inventory_foods/1.json
  def destroy
    @inventory_food.destroy

    respond_to do |format|
      format.html { redirect_to inventory_foods_url, notice: "Inventory food was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_food
      @inventory_food = InventoryFood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_food_params
      params.require(:inventory_food).permit(:quantity, :food_id)
    end
end
