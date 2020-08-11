class CocktailMaker::Popular_menu

MENU = ["Margarita", "Tequila Sunrise", "Whiskey Sour"]

def initialize
  MENU.each.with_index(1) do |cocktail, index|
   puts "#{index}. #{cocktail}"
  end
  get_your_cocktail

end

def get_your_cocktail
  puts "Please pick your favourite cocktail!"
  input = gets.strip
  cocktail = MENU[input.to_i - 1]
  #TODO: find a cocktail
  result = CocktailMaker::Cocktail.make_cocktail(cocktail)
  #result = CocktailMaker::API.get_by_name(cocktail)
  # binding.pry
end


end
