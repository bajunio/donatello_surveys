class Response < ActiveRecord::Base

	belongs_to :questions, :choices

end
