class AddPointsSystemToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :pointssystem, :integer
  end
end
