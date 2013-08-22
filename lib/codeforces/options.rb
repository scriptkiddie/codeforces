module Codeforces
	module Options

		def parse_debug
			@parser.on('--debug', 'Run in debug mode') do
			 	@options[:debug] = true
			end
		end

		def parse_default
			@parser.on('--default', 'Use this settings as default') do
			end
		end

		def parse_directory 
			@parser.on('-d', '--directory <path>', 'Specify a directory') do |path|
				@options[:directory] = path
			end
		end

		def parse_fast
			@parser.on('-f', '--fast', 'Skip generating translations') do
				@options[:fast] = true
			end
		end

		def parse_help
			@parser.on('-h', '--help', 'Print this message') do
			 	puts o; exit
			end
		end

		def parse_language
			@parser.on('-l', '--language <x,y,z>', 'Limit template generation') do
			end
		end

		def parse_pack
			@parser.on('--pack', 'Delete all untouched templates')
		end

		def parse_parse
			@parser.on('-p', '--parse <id>', 'Parse a contest') do |id|
				@options[:id] = id
			end
		end

		def parse_version
			@parser.on('-v', '--version', 'Print generator’s version') do
				version
			end
		end

		def parse_word
			@parser.on('-w', '--word', 'Name folders using latin script') do
				@options[:word] = true
			end
		end

	end
end