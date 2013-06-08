# encoding: utf-8
module Codeforces
  # require 'numbers_and_words'
  require 'ruby-progressbar'
  require 'nokogiri'
  require 'open-uri'

  class Parser; class << self
    def convert html
      html.gsub(/<.+?>(.+)<\/.+?>/) { $1.gsub(/<br\/?>/, "\n") }
    end
    def parse id
      problems = {}
      bar = ProgressBar.create(title: 'Задания', total: 26)
      ('A'..'Z').each do |letter|
        problem = Nokogiri::HTML open "http://codeforces.ru/contest/#{id}/problem/#{letter}?locale=en"
        input, output = [], []

        problem.css('.sample-test').each do |test|
          input << convert(test.css('.input pre').first.to_html)
          output << convert(test.css('.output pre').first.to_html)
        end

        break if input.empty? or output.empty?
        problems.merge! problem.css('.header .title').text.downcase.gsub(' ', '-').gsub(/[^\w-]/, '')[2..-1] => [input, output]
        bar.increment
      end
      p problems
    end
  end end
end
