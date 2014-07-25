class Question < ActiveRecord::Base
	belongs_to :survey
	has_many :choices

	def find_choice(choice_text)
		self.choices.where(choice: choice_text).first
	end

	def total_responses
		self.choices.map(&:response_count).reduce(:+)
	end
end