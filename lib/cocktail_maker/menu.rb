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
    if @menu.count > 1
     puts "Please pick your favourite cocktail!"
     input = gets.strip
     cocktail = @menu[input.to_i - 1]
     result = CocktailMaker::Cocktail.find(cocktail)
     
     result.display_cocktail
   else
     result.display_cocktail
   end

    #
    #  result = CocktailMaker::Cocktail.make_cocktail(cocktail)


    #  if result.count > 1
    #     puts "Please pick a cocktail"
    #     @menu = result
    #     final_menu = CocktailMaker::Menu.new(result)
    #     final_menu.display_menu
     #
    #   end
   end
end
