class AddSponsorToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :sponsor, :string
  end
end
