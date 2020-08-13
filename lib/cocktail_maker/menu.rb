class CocktailMaker::Menu
   def initialize(menu)
     @menu = menu
   end

   def display_menu
     @menu.each.with_index(1) do |cocktail, index|
      puts "#{index}. #{cocktail}"
     end
   end

   def get_your_cocktail
     puts "Please pick your favourite cocktail!"
     input = gets.strip
     cocktail = @menu[input.to_i - 1]
     result = CocktailMaker::Cocktail.make_cocktail(cocktail)
   end
end
