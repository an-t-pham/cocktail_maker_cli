require_relative "./cocktail_maker/version"
require_relative "cocktail_maker/cli"
require_relative "cocktail_maker/api"
require_relative "cocktail_maker/popular_menu"
require_relative "cocktail_maker/cocktail"

require 'pry'
require 'net/http'

module CocktailMaker
  class Error < StandardError; end
  # Your code goes here...
end
