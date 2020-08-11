class CocktailMaker::Cocktail
  attr_accessor :name, :ingredient
  @@all = []
  def initialize(name)
    @name = name
  end

  def self.make_cocktail(name)
    result = CocktailMaker::API.get_by_name(name)
    @@all << self
    binding.pry
  end
end
