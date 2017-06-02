#Este controlador lo reemplazamos por el food_controller

=begin
class FoodController < ApplicationController


  def create
    foods = food_params
    foods[:date] = DateTime.now
    @food = Food.new(foods)
    @food.save
    redirect_to @food
  end

  def show
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:quantity, :date)
  end

  def listed_food
    @foods = Food.all
  end

end
=end