class CocktailMaker::Cocktail
  attr_accessor :name, :ingredient
  @@all = []
  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def self.create(cocktail_data)
    self.new(cocktail_data["strDrink"])
  end

  def self.make_cocktail(name)
    result = CocktailMaker::API.get_by_name(name)
    the_cocktail = JSON.parse(result)
    final_cocktail = nil
    the_cocktail["drinks"].each do |drink|
      self.create(drink)
    #  final_cocktail = {
    #     :name => drink["strDrink"],
    #     :glass => drink["strGlass"],
    #     :video => drink["strVideo"],
    #     :image => drink["strDrinkThumb"],
    #     :instruction => drink["strInstructions"],
    #     # :ingredient1 => drink["strIngredient1"],
    #     # :measure1 => drink["strMeasure1"],
    #   }
    end
    binding.pry
      # the_cocktail["drinks"].each.with_index(1) do |drink, index|
      # final_cocktail = {
      #   :ingredient => drink["strIngredient#{index}"],
      #   :measure => drink["strMeasure#{index}"]
      #   }
      #   binding.pry
      # end
      #
      #  final_cocktail
  end






end
