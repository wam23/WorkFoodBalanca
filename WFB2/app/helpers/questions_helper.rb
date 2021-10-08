module QuestionsHelper
  
  def get_all_types
    return { "1" => "Yes / No",
             "2" => "Value",
             "3" => "YB / guest" }
  end

  def get_all_pointssystem
    return { "1" => "Normal (1P per question)",
             "2" => "Set points" }
  end

end
