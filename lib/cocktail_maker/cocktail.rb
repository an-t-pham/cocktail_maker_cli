class CocktailMaker::Cocktail
  attr_accessor :name, :type, :ingredients, :glass, :video_url, :image_url, :instruction, :measures
  @@all = []
  def initialize(name, type, glass, image_url, instruction)
    @name = name
    @type = type
    @glass = glass
    @image_url = image_url
    @instruction = instruction
    @ingredients = []
    @measures = []
  end

  def save
    @@all << self
  end

  def full_ingredient
    ingre = {}
    index = 0
    @ingredients.each do |ingredient|
      ingre[ingredient] = @measures[index]
      index += 1
    end
    ingre
  end

  def display_cocktail
    puts "1. Name:".colorize(:light_red) + " " +"#{@name}".colorize(:cyan)
    puts "2. Type:".colorize(:light_red) + " " + "#{@type}".colorize(:cyan)
    puts "3. Glass:".colorize(:light_red) + " " + "#{@glass}".colorize(:cyan)
    puts "4. Image:".colorize(:light_red) + " " + "#{@image_url}".colorize(:cyan)
    puts "5. Ingredients:".colorize(:light_red) + " " + "#{self.full_ingredient}".colorize(:cyan)
    puts "6. Instruction:".colorize(:light_red) + " " + "#{@instruction}".colorize(:cyan)
  end

  def self.create(cocktail_data)
    new_cocktail = self.new(cocktail_data["strDrink"], cocktail_data["strAlcoholic"], cocktail_data["strGlass"], cocktail_data["strDrinkThumb"], cocktail_data["strInstructions"])
    counter = 1
    until cocktail_data["strIngredient#{counter}"] == nil
      new_cocktail.ingredients << cocktail_data["strIngredient#{counter}"]
      counter += 1
    end

    num = 1
    until cocktail_data["strMeasure#{num}"] == nil
      new_cocktail.measures << cocktail_data["strMeasure#{num}"]
      num += 1
    end

    new_cocktail.save
  end

  def self.find(cocktail_name)
    a = @@all.filter { |cocktail| cocktail.name == cocktail_name }
  end

  def self.find_or_create(cocktail_name)
    result = CocktailMaker::API.get_by_name(cocktail_name)

    if result != "{\"drinks\":null}"
      the_cocktail = JSON.parse(result)
      final_cocktail = nil
      final_list = []
         the_cocktail["drinks"].each do |drink|
            final_cocktail = self.create(drink) unless self.find(drink["strDrink"]).count > 0
            final_list << drink["strDrink"]
         end
      final_cocktail
      final_list
     else
      puts "No result found for #{name}"
    end
  end

    def self.search_by_ingredient(ingredient)
          result = CocktailMaker::API.get_by_ingredient(ingredient)
        if result != ""
           cocktail = JSON.parse(result)
            matching_cocktail = []

            cocktail["drinks"].each do |drink|
            matching_cocktail << drink["strDrink"]
             end
            matching_cocktail

           puts "Here are the matching cocktails of your ingredient"
           new_menu = CocktailMaker::Menu.new(matching_cocktail)
           new_menu.display_menu
           r = new_menu.get_user_decision
           this_cocktail = CocktailMaker::Cocktail.find_or_create(r)
           m = CocktailMaker::Menu.new(this_cocktail)
           m.get_cocktail_w_name

          else
           puts "No result found for #{ingredient}"
         end
   end

   def self.random_cocktail
     result = CocktailMaker::API.get_random_cocktail
     new_cocktail = JSON.parse(result)
     final_cocktail = CocktailMaker::Cocktail.find_or_create(new_cocktail["drinks"].first["strDrink"])
     m = CocktailMaker::Menu.new(final_cocktail)
     m.get_cocktail_w_name
   end

end
