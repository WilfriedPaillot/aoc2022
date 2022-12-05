#frozen_string_literal: true

module Day3
  class Part1
    attr_reader :file
    ALPHA = ("a".."z").to_a + ("A".."Z").to_a

    def initialize(file)
      @file = file
    end

    def perform
      question

      output = []
      rucksacks = read_file

      rucksacks.each do |rucksack|
        half = rucksack.length / 2
        first_half = rucksack[0..half]
        second_half = rucksack[half..-1]

        first_half.split("").each do |letter|
          if second_half.include?(letter)
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
      puts "Find the item type that appears in both compartments of each rucksack. What is the sum of the priorities of those item types?"
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
      @open_file ||= File.open(File.dirname(__FILE__) + "/#{file}")
    end
  end
end
