class CocktailMaker::Cocktail
  attr_accessor :name, :ingredients, :glass, :video_url, :image_url, :instruction, :measures
  @@all = []
  def initialize(name, glass, image_url, instruction)
    @name = name
    @glass = glass

    @image_url = image_url
    @instruction = instruction
    @ingredients = []
    @measures = []
  end

  def save
    @@all << self
  end

  def self.create(cocktail_data)
    new_cocktail = self.new(cocktail_data["strDrink"], cocktail_data["strGlass"], cocktail_data["strDrinkThumb"], cocktail_data["strInstructions"])
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

  def self.make_cocktail(name)
    result = CocktailMaker::API.get_by_name(name)
    the_cocktail = JSON.parse(result)
    final_cocktail = nil
    the_cocktail["drinks"].each do |drink|
      final_cocktail = self.create(drink)
    end
    final_cocktail
    ingre = {}
    index = 0
    final_cocktail.first.ingredients.each do |ingredient|
      ingre[ingredient] = final_cocktail.first.measures[index]
      index += 1
    end

    puts "1. Name: #{final_cocktail.first.name}"
    puts "2. Glass: #{final_cocktail.first.glass}"
    puts "3. Image: #{final_cocktail.first.image_url}"
    puts "4. Ingredients: #{ingre}"
    puts "5. Instruction: #{final_cocktail.first.instruction}"
  end


end
