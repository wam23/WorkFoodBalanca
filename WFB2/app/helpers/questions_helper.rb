module QuestionsHelper
  
  def get_all_types
    return { "1" => "Yes / No",
             "2" => "Value",
             "3" => "Enumeration"  }
  end


end
