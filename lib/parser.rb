# encoding: utf-8
module Codeforces
  require 'ruby-progressbar'
  require 'nokogiri'
  require 'open-uri'

  class Parser; class << self
    def convert node
      node.to_html.gsub(/<.+?>(.+)<\/.+?>/) { $1.gsub(/<br\/?>/, "\n") }
    end
    def parse id
      problems = {}
      bar = ProgressBar.create title: 'Prolems', total: 26 # latin alphabet
      ('A'..'Z').each do |letter|
        problem = Nokogiri::HTML open "http://codeforces.ru/contest/#{id}/problem/#{letter}?locale=en"
        input, output = [], []

        problem.css('.sample-test').each do |test|
          input << convert(test.css('.input pre').first)
          output << convert(test.css('.output pre').first)
        end

        break if input.empty? or output.empty?
        problems.merge! letter => {
          :name => problem.css('.header .title').text,
          :input => input,
          :output => output
        }

        bar.increment
      end
      problems
    end
  end end
end
