class CocktailMaker::CLI
  MENU = ["Cosmopolitan", "Long Island Iced Tea", "Mai tai", "Margarita", "Martini", "Mojito", "Negroni", "Pina Colada", "Tequila Sunrise", "Whiskey Sour"]
  attr_accessor :menu

  def initialize
    @popular_menu = CocktailMaker::Menu.new(MENU)
  end

  def call
    get_user_move
  end

  def display_actions
    puts "1. Have a look at the popular menu"
    puts "2. Search by name"
    puts "3. Search by ingredient"
    puts "4. Surprise me!"
    puts "5. Exit"
  end

  def get_cocktail_by_menu
    puts "Here are the top 10 cocktails of 2020"
    @popular_menu.display_menu
    @popular_menu.get_cocktail_by_pop_menu
  end

  def get_cocktail_by_name
    puts "Please type the name of your favourite cocktail!"
    name = gets.strip
    the_cocktail = CocktailMaker::Cocktail.find_or_create(name)
    m = CocktailMaker::Menu.new(the_cocktail)
    m.display_menu
    puts m.get_cocktail_w_name
  end

  def get_cocktail_by_ingredient
    puts "Please type the ingredient"
    ingredient = gets.strip
    CocktailMaker::Cocktail.search_by_ingredient(ingredient)
  end


  def get_user_move
    puts "Welcome to Cocktail Maker! How would you like to search for the cocktail recipe?"
    display_actions
    input = gets.strip.to_i
      if input == 1
        puts
        get_cocktail_by_menu
        puts
        get_user_move
      elsif input == 2
        puts
        get_cocktail_by_name
        puts
        get_user_move
      elsif input == 3
        puts
        get_cocktail_by_ingredient
        puts
        get_user_move
      elsif input == 4
        puts
        CocktailMaker::Cocktail.random_cocktail
        puts
        get_user_move
       elsif input == 5
       else
         puts "Please pick a number from the list"
         get_user_move
      end
  end


end
