class ExternalFoodsController < ApplicationController

  #before_action :authenticate_user!
  before_action :set_external_food, only: [:show, :edit, :update, :destroy]

  # GET /external_foods
  # GET /external_foods.json
  def index
    @external_foods = ExternalFood.all
  end

  # GET /external_foods/1
  # GET /external_foods/1.json
  def show
  end

  # GET /external_foods/new
  def new
    @external_food = ExternalFood.new
  end

  # GET /external_foods/1/edit
  def edit
  end

  # POST /external_foods
  # POST /external_foods.json
  def create
    @external_food = ExternalFood.new(external_food_params)
    @external_food.date = Date.today()
    @external_food.save

=begin
    respond_to do |format|
      if @external_food.save
        format.html { redirect_to @external_food, notice: 'External food was successfully created.' }
        format.json { render :show, status: :created, location: @external_food }
      else
        format.html { render :new }
        format.json { render json: @external_food.errors, status: :unprocessable_entity }
      end 
      
    end
=end
    redirect_to "/foods"
  end

  # PATCH/PUT /external_foods/1
  # PATCH/PUT /external_foods/1.json
  def update
    respond_to do |format|
      if @external_food.update(external_food_params)
        format.html { redirect_to @external_food, notice: 'External food was successfully updated.' }
        format.json { render :show, status: :ok, location: @external_food }
      else
        format.html { render :edit }
        format.json { render json: @external_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /external_foods/1
  # DELETE /external_foods/1.json
  def destroy
    @external_food.destroy
    respond_to do |format|
      format.html { redirect_to external_foods_url, notice: 'External food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_external_food
      @external_food = ExternalFood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def external_food_params
      params.require(:external_food).permit(:quantity, :date)
    end
end
