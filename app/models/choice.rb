class Choice < ActiveRecord::Base

	belongs_to :question

	def increment_count
		self.update(response_count: (self.response_count+1))
	end

end