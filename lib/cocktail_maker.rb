require_relative "./cocktail_maker/version"
require_relative "cocktail_maker/cli"
require_relative "cocktail_maker/api"
require_relative "cocktail_maker/popular_menu"

require 'pry'
module CocktailMaker
  class Error < StandardError; end
  # Your code goes here...
end
