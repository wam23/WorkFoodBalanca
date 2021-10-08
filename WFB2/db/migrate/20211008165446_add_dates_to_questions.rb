class AddDatesToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :start_at, :datetime
    add_column :questions, :end_at, :datetime
  end
end
