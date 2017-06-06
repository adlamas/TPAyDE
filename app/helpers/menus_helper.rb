module MenusHelper

	def checked(area)

		@menu.day.nil? ? false : @menu.day.match(area)
		
	end

end
