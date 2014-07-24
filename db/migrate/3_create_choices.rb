class CreateChoices < ActiveRecord::Migration

	def change
		create_table :choices do |t|
			t.string :choice
			t.integer :response_count, default: 0
			t.belongs_to :question

			t.timestamps
		end
	end
end
