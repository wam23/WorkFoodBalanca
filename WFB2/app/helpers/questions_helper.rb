module QuestionsHelper
  
  def get_all_types
    return { "1" => "Yes / No",
             "2" => "Value",
             "3" => "YB / guest",
             "4" => "YB player" }
  end

  def get_all_pointssystem
    return { "1" => "Normal (1P per question)",
             "2" => "Set points",
             "3" => "Pot" }
  end
  
  def get_all_players_sorted
    return self.get_all_players.sort_by { |k, v| k.to_i }
  end
  
  def get_all_players
    return { "26" => "David von Ballmoos",
             "4" => "Mohamed Ali Camara",
             "5" => "Cédric Zesiger",
             "21" => "Ulisses Garcia",
             "28" => "Fabian Lustenberger",
             "36" => "Silvan Hefti",
             "8" => "Vincent Sierro",
             "10" => "Miralem Sulejmani",
             "13" => "Nicolas Moumi Ngamaleu",
             "16" => "Christian Fassnacht",
             "20" => "Michel Aebischer",
             "30" => "Sandro Lauper",
             "32" => "Fabian Rieder",
             "35" => "Christopher Martins",
             "15" => "Meschak Elia",
             "17" => "Jordy Siebatcheu",
             "18" => "Jean-Pierre Nsame",
             "19" => "Felix Mambimbi"
              }
  end

end
