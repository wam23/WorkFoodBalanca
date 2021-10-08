class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :info
      t.integer :questiontype

      t.timestamps
    end
  end
end
