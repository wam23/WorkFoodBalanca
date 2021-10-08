class AddResponseToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :response, :integer
  end
end
