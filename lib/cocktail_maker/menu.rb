class CocktailMaker::Menu
  attr_accessor :menu
  
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

        result.first.display_cocktail
      else
        result1 = CocktailMaker::Cocktail.find(@menu.first)
        result1.first.display_cocktail
      end
   end


end
