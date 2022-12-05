#frozen_string_literal: true

module Day3
  class Part2
    attr_reader :file

    ALPHA = ("a".."z").to_a + ("A".."Z").to_a

    def initialize(file)
      @file = file
    end

    def perform
      question
      
      output = []
      list = read_file

      list.each_slice(3) do |group|
        group[0].split("").each do |letter|
          if group[1].include?(letter) && group[2].include?(letter)
            output << ALPHA.index(letter) + 1
            break
          end
        end
      end

      output(output.sum)
    end

    private

    def question
      puts ""
      puts "Find the item type that corresponds to the badges of each three-Elf group. What is the sum of the priorities of those item types?"
    end

    def output(result)
      puts ""
      puts "The sum of the priorities is #{bold(result)}."
      puts ""
    end

    def bold(input)
      "\033[1m#{input}\033[0m"
    end

    def read_file
      @read_file ||= open_file.readlines.map(&:chomp)
    end

    def open_file
      @open_file ||= File.open(File.dirname(__FILE__) + "/" + file)
    end
  end
end
