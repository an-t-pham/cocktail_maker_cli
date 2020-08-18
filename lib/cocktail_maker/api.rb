class CocktailMaker::API

  BASE_URL = "https://www.thecocktaildb.com/api/json/v1/1"

  def self.get_by_name(name)
    uri = URI("#{BASE_URL}/search.php?s=#{name}")
    Net::HTTP.get(uri)
  end

  def self.get_by_ingredient(ingredient)
    uri = URI("#{BASE_URL}/filter.php?i=#{ingredient}")
    Net::HTTP.get(uri)
  end

  def self.get_random_cocktail
    uri = URI("#{BASE_URL}/random.php")
    Net::HTTP.get(uri)
  end
end
