class AddPointsToAnswer < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :points, :integer
  end
end
