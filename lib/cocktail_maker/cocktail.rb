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
    puts "1. Name: #{@name}"
    puts "2. Type: #{@type}"
    puts "3. Glass: #{@glass}"
    puts "4. Image: #{@image_url}"
    puts "5. Ingredients: #{self.full_ingredient}"
    puts "6. Instruction: #{@instruction}"
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

  def self.make_cocktail(name)
    result = CocktailMaker::API.get_by_name(name)

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




      #  if final_list.count > 1
      #     puts "Please pick a cocktail"
      #     final_menu = CocktailMaker::Menu.new(final_list)
      #     final_menu.display_menu
      #
      #   end
          # puts final_menu.get_your_cocktail


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
           puts new_menu.get_your_cocktail
          else
           puts "No result found for #{ingredient}"
         end
   end

end
