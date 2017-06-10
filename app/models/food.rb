class Food < ActiveRecord::Base

  def self.register_food_from_user(params)
    Food.create(params)
  end

end
