class CocktailMaker::API

  BASE_URL = "https://www.thecocktaildb.com/api/json/v1/1"

  def self.get_by_name(name)
    uri = URI("#{BASE_URL}/search.php?s=#{name}")
    Net::HTTP.get(uri)
  end

  def self.get_by_ingredient(ingredient)
    uri = URI("#{BASE_URL}/filter.php?i=#{ingredient}")
    Net::HTTP.get(uri)
    # link = URI.parse("#{BASE_URL}/filter.php?i=#{ingredient}")
    # request = Net::HTTP::Get.new(link.path)
    # begin
    #   response = Net::HTTP.start(link.host, link.port) {|http|
    #     http.read_timeout = 1 #Default is 60 seconds
    #     http.request(request)
    #   }
    #   puts response
    # rescue Net::ReadTimeout => e
    #    puts e.message
    # end

  end
end
