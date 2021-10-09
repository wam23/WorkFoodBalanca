class AddPotEvaluatedToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :potevaluated, :boolean
  end
end
