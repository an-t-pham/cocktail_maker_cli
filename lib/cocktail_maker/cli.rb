class CocktailMaker::CLI
  def call
    puts "Welcome to Cocktail Maker! How would you like to search for the cocktail recipe?"
    get_user_input
    list_popular_menu
    # get_recipes(name)
    # get_recipes(ingredient)
  end

  def get_user_input
   puts "1. Have a look at the popular menu"
   puts "2. Search by name"
   puts "3. Search by ingredient"
   puts "4. Surprise me!"

   input = gets.strip
  end

  def list_popular_menu
    CocktailMaker::Popular_menu.new
  end

  def user_response
    input = get_user_input.to_i
      if input == 1
        list_popular_menu
      end
  end


end
