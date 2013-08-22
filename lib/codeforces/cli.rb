# coding: utf-8
require 'optparse'
require 'codeforces/options'

module Codeforces
  class CLI
    def initialize(arguments = ARGV, width = 18, help_if_empty = true)
      @arguments = String === arguments ? arguments.split : Array(arguments)
      @arguments << '-h' if @arguments.empty? and help_if_empty
      @parser = OptionParser.new do |parser|
        @parser = parser
        parser.summary_width = width
        parse_options
      end
    end

    def parse_options
      puts methods
      parsers = methods.delete_if { |m| not m.to_s.start_with? 'parse_' }
      parsers.delete(:parse_options)
      parsers.each { |parser| send parser }
    end

    def run
      @parser.parse!(@arguments.dup)
    end

    def version
      require 'codeforces/version'
      abort "Codeforces #{VERSION}"
    end
  end
end
