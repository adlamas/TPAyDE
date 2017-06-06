class Menu < ActiveRecord::Base

	#validates that fields are not empty
	validates :dish, :presence => true
	validates :day, :presence => true

	before_save do 
		self.day.gsub!(/[\[\[\[\]\"]/, "") if attribute_present?("day")
	end

end
