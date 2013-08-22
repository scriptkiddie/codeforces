require 'ostruct'

module Codeforces
	Environment = OpenStruct.new
	Environment.directory = '.'
	Environment.languages = %w[ruby python cpp]
	
end