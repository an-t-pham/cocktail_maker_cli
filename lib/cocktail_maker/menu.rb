class CocktailMaker::Menu
  attr_accessor :menu

  def initialize(menu)
    @menu = menu
  end

  def display_menu
    @menu.each.with_index(1) do |cocktail, index|
    puts "#{index}. #{cocktail}".colorize(:light_magenta)
    end
  end

  def get_cocktail_w_name
    if @menu.count > 1
      puts
      get_your_cocktail(get_user_decision)
    else
      puts
      get_your_cocktail(@menu.first)
    end
  end

   def get_cocktail_by_pop_menu
     result = CocktailMaker::Cocktail.find_or_create(get_user_decision)
     new_menu = CocktailMaker::Menu.new(result)
     new_menu.display_menu

     if new_menu.menu.count > 1
       a = new_menu.get_user_decision
       puts
       get_your_cocktail(a)
     else
       puts
       get_your_cocktail(new_menu.menu.first)
     end
   end

   def get_your_cocktail(name)
     r = CocktailMaker::Cocktail.find(name)
     r.first.display_cocktail
   end

   def get_user_decision
     puts
     puts "Please pick your favourite cocktail!"
     input = gets.strip
     cocktail = @menu[input.to_i - 1]
   end


end
