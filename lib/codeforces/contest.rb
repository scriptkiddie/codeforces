require 'codeforces/generator'
require 'codeforces/parser'

module Codeforces
  class Contest
    # @param options [Hash] options array from Executable module
    # @return [Contest] new instance of the class
    def initialize(options = {})
      options.each { |k,v| instance_variable_set("@#{k}", v) }
      throw ArgumentError unless @id
      @directory ||= '.'
      @languages ||= %w[ruby c++ python]
    end

    include Generator
    include Parser

    # Runs the whole process using instance variables specified
    # @return [] 
    def run
      generate @directory, parse(@id)
    end
  end
end
