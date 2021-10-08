class AnswerRelations2 < ActiveRecord::Migration[6.1]
  def change
    create_table :answers_questions, id: false do |t|
      t.belongs_to :answer
      t.belongs_to :question
    end
  end
end
