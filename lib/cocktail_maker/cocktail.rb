class CocktailMaker::Cocktail
  attr_accessor :name, :ingredient
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.make_cocktail(name)
    result = CocktailMaker::API.get_by_name(name)
    the_cocktail = JSON.parse(result)
    final_cocktail = nil
    the_cocktail["drinks"].each do |drink|
     final_cocktail = {
        :name => drink["strDrink"],
        :glass => drink["strGlass"],
        :video => drink["strVideo"],
        :image => drink["strDrinkThumb"],
        :instruction => drink["strInstructions"],
        :ingredient1 => drink["strIngredient1"],
        :measure1 => drink["strMeasure1"],
      }
    end
   final_cocktail
  end


  def self.make_cocktail_complete(name)
    c = self.make_cocktail(name)



end
