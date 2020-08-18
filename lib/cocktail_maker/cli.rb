class CocktailMaker::CLI
  MENU = ["Cosmopolitan", "Long Island Iced Tea", "Mai tai", "Margarita", "Martini", "Mojito", "Negroni", "Pina Colada", "Tequila Sunrise", "Whiskey Sour"]
  attr_accessor :menu

  def initialize
    @popular_menu = CocktailMaker::Menu.new(MENU)
  end

  def call
    puts "\nWelcome to Cocktail Maker!\n".colorize(:red)
    get_user_move
  end

  def display_actions
    puts "1. Have a look at the popular menu".colorize(:light_cyan)
    puts "2. Search by name".colorize(:light_cyan)
    puts "3. Search by ingredient".colorize(:light_cyan)
    puts "4. Surprise me!".colorize(:light_cyan)
    puts "5. Exit".colorize(:light_cyan)
  end

  def get_cocktail_by_menu
    puts "Here are the top 10 cocktails of 2020".colorize(:light_red)
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
    puts "How would you like to search for the cocktail recipe?".colorize(:light_blue)
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
         puts "\nPlease pick a number from the list\n".colorize(:red)
         get_user_move
      end
  end


end
