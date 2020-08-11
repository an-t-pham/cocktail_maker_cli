class CocktailMaker::Cocktail
  attr_accessor :name, :ingredient
  @@all = []
  # def initialize(name)
  #   @name = name
  # end

  def self.make_cocktail(name)
    result = CocktailMaker::API.get_by_name(name)
    the_cocktail = JSON.parse(result)
    final_cocktail = nil
    the_cocktail["drinks"].each.with_index(1) do |drink, index|
     final_cocktail = {
        :name => drink["strDrink"],
        :glass => drink["strGlass"],
        :video => drink["strVideo"],
        :image => drink["strDrinkThumb"]
        :ingredient1 => drink["strIngredient1"],
        :measure1 => drink["strMeasure1"],



      }
    end
   final_cocktail
  #@@all << self
    binding.pry

  end
end
