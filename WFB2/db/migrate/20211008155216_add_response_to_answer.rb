class AddResponseToAnswer < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :response, :integer
  end
end
