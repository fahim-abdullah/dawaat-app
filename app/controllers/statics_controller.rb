class StaticsController < ApplicationController
	def coming_soon
		# redirect_to root_path
    @disable_navbar = true
	end

	def ourstory
	end

	def thankyou
	end

	def contactus
	end

	def tpi
		# @disable_navbar = true
		@disable_footer = true
	end

end