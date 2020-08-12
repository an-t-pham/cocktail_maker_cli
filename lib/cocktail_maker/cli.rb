class CocktailMaker::CLI
  attr_accessor :menu

  def initialize
    @menu = CocktailMaker::Popular_menu.new
  end

  def call
    puts "Welcome to Cocktail Maker! How would you like to search for the cocktail recipe?"
    get_user_move
    # get_recipes(name)
    # get_recipes(ingredient)
  end

  def display_actions
    puts "1. Have a look at the popular menu"
    puts "2. Search by name"
    puts "3. Search by ingredient"
    puts "4. Surprise me!"
  end

  def get_user_cocktail
    @menu.display_menu
    puts @menu.get_your_cocktail
  end

  def get_cocktail_by_name
    puts "Please type the name of your favourite cocktail!"
    name = gets.strip
    the_cocktail = CocktailMaker::Cocktail.make_cocktail(name)

  end

  def get_cocktail_by_ingredient
    puts "Please type the ingredient"
    ingredient = gets.strip
    CocktailMaker::Cocktail.search_by_ingredient(ingredient)
  end

  def get_user_move
    display_actions
    input = gets.strip.to_i
      if input == 1
        get_user_cocktail
      elsif input == 2
        get_cocktail_by_name
      elsif input == 3
        get_cocktail_by_ingredient
      end
  end


end
