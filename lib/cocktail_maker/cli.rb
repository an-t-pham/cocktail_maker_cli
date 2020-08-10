class CocktailMaker::CLI
  def call
    puts "Welcome to Cocktail Maker! How would you like to search for the cocktail recipe?"
    get_user_input
    # list_popular_menu
    # get_recipes(name)
    # get_recipes(ingredient)
  end

  def get_user_input
     puts "1. I would like to have a look at the popular menu"
     puts "2. I would like to search by name"
     puts "3. I would like to search by ingredient"
     puts "4. Surprise me"

     input = gets.strip
  end
end
