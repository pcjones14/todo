module ApplicationHelper

	def random_string(length)
		chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
		return chars.shuffle[0,length].join
	end

end
