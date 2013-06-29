# encoding: utf-8
module Codeforces
  module Parser
    require 'ruby-progressbar'
    require 'nokogiri'
    require 'open-uri'
    # Parses a context into an array by its’ ID
    # 
    # @return [Hash] with parsing results
    # @example
    #   Parser.parse(321)
    #   {"A"=> {
    #       :name   => "A. Ciel and Robot",
    #       :input  => ["2 2\nRU\n"],
    #       :output => ["Yes\n"]}, ...}
    def parse(id)
      problems = {}
      bar = ProgressBar.create(title: 'Prolems', total: 26) # latin alphabet
      ('A'..'Z').each do |letter|
        problem = Nokogiri::HTML open("http://codeforces.ru/contest/#{id}/problem/#{letter}?locale=en")
        input, output = [], []

        problem.css('.sample-test').each do |test|
          input  << pre(test.at '.input pre')
          output << pre(test.at '.output pre')
        end

        break if input.empty? or output.empty?
        problems.merge! letter => {
          :name => problem.at('.header .title').text,
          :input => input,
          :output => output
        }
        bar.increment
      end
      problems
    end

    # Converts a <pre>...</pre> node into a string
    # 
    # @return [String] processed text including newlines
    def pre(node)
      node.to_html.gsub(/<.+?>(.+)<\/.+?>/) { $1.gsub(/<br\/?>/, "\n") }
    end
  end
end
