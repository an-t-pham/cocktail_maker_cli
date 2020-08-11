class CocktailMaker::Popular_menu

MENU = ["Margarita", "Tequila Sunrise", "Whiskey Sour"]

def display_menu
  MENU.each.with_index(1) do |cocktail, index|
   puts "#{index}. #{cocktail}"
  end
end



def get_your_cocktail
  puts "Please pick your favourite cocktail!"
  input = gets.strip
  cocktail = MENU[input.to_i - 1]
  #TODO: find a cocktail
  result = CocktailMaker::Cocktail.make_cocktail(cocktail)


end


end
