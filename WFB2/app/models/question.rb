class Question < ApplicationRecord
  has_and_belongs_to_many :answers
  
  TYPES = {1 => "Yes / No", 2 => "Value"}
  
end
