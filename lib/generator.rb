module Codeforces
  # Used for generating 
  module Generator
    require 'fileutils'
    def generate(parse_results)
      contest = './' + rename_contest(@id)
      create_folder contest
      change_directory contest
      parse_results.each { |problem| create_problem(problem) }
    end

    def create_problem(problem)
      samples = 'samples'.freeze
      letter, content = problem

      create_folder content[:name]
      create_folder samples
      change_directory samples

      create_tests content[:input], content[:output]
      change_directory '..'
    end

    def create_tests(input, output)
      input.each_index do |i|
        create_file "#{i}.in", input[i]
        create_file "#{i}.out", output[i]
      end
    end

    def create_folder(path)
      FileUtils.mkdir(path)
    end

    def change_directory(path)
      File.chdir(path)
    end

    # @param path [String] relative path
    # @param content [String] file content
    # @return [Boolean] true if OK, false if something went wrong
    def create_file(path, content)
      File.write path, content
    end

    # @param name [String] task name
    # @return [String] formatted string
    # @example
    #   rename("A. Ciel and Robot") # => 'a-ciel-and-robot'
    def rename(name)
      name.downcase.gsub(/\s/, '-').gsub(/[^\w-]/, '')
    end

    # @param id [Integer] contest id
    # @return [String] contest name
    def rename_contest(id)
      if @words
        require 'numbers_and_words' unless 0.respond_to? :to_words
        return id.to_words.gsub(/\s+/, '-')
      end
      id.to_s
    end
  end
end
