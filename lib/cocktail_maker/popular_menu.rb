class CocktailMaker::Popular_menu

MENU = ["Cosmopolitan", "Long Island Iced Tea", "Mai tai", "Margarita", "Martini", "Mojito", "Negroni", "Pina Colada", "Tequila Sunrise", "Whiskey Sour"]

   def display_menu
     puts "Here are the top 10 cocktails of 2020"
     MENU.each.with_index(1) do |cocktail, index|
      puts "#{index}. #{cocktail}"
     end
   end



   def get_your_cocktail
     puts "Please pick your favourite cocktail!"
     input = gets.strip
     cocktail = MENU[input.to_i - 1]
     result = CocktailMaker::Cocktail.make_cocktail(cocktail)
   end


end
