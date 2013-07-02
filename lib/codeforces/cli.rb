# coding: utf-8
require 'optparse'

module Codeforces
  class CLI
    def initialize(arguments = ARGV, width = 18, help_if_empty = true)
      @arguments = String === arguments ? arguments.split : Array(arguments)
      @arguments << '-h' if @arguments.empty? and help_if_empty
      @parser = OptionParser.new do |o|
        o.summary_width = width
        o.on('--debug', 'Run in debug mode') { options[:debug] = true }
        o.on('--default', 'Use this settings as default')
        o.on('-d', '--dir <dir>', 'Specify a directory') { |dir| options[:directory] = dir }
        o.on('-f', '--fast', 'Skip generating translations') { options[:fast] = true }
        o.on('-h', '--help', 'Print this message') { abort o }
        o.on('-l', '--lang <x,y,z>', 'Limit template generation')
        o.on('--pack', 'Delete all untouched templates')
        o.on('-p', '--parse <id>', 'Parse a contest') { |id| options[:id] = id }
        o.on('-v', '--version', 'Print generator’s version') { version }
        o.on('-w', '--word', 'Name folders using latin script') { options[:word] = true }
      end
    end

    def parse
      @parser.parse!(@arguments.dup)
    end

    def version
      require 'codeforces/version'
      abort "Codeforces #{VERSION}"
    end
  end
end
