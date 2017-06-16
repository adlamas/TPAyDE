class Menu < ActiveRecord::Base

	
	#validates that fields are not empty
	validates :dish, :presence => {:message => ": Debe ingresar el nombre del plato"}
	validates :day, :presence => {:message => ": Debe ingresar los días que estara disponible"}

	before_save do 
		self.day.gsub!(/[\[\[\[\]\"]/, "") if attribute_present?("day")
	end

end
