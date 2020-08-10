class CocktailMaker::API

  BASE_URL = "https://www.thecocktaildb.com/api/json/v1/1"

  def self.get_by_name(name)
    uri = URI("#{BASE_URL}/search.php?s=#{name}")
    Net::HTTP.get(uri)
  end
end
