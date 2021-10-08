class RenameTypeToQuestionType < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :questions, :type, :questiontype
  end

  def self.down
    
  end
end
