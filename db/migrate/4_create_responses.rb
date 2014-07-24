class CreateResponses < ActiveRecord::Migration

	def change
		create_table :respones do |t|
			t.belongs_to :questions
			t.belongs_to :choices
		end
	end
end

