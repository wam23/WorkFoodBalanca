class Answer < ApplicationRecord
  has_and_belongs_to_many :question
  has_and_belongs_to_many :user
end
