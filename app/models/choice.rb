class Choice < ActiveRecord::Base

	belongs_to :question

	def increment_count
		self.update(response_count: (self.response_count+1))
	end

  def percent_of_total_responses
    (self.response_count / self.question.total_responses.to_f) * 100
  end

end
