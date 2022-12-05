#frozen_string_literals: true

module Day1
  class Part1
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def perform
      question
      output(subtotals.max)
    end

    private
    
    def question
      puts ""
      puts "Find the Elf carrying the most Calories. How many total Calories is that Elf carrying?"
    end

    def output(result)
      puts ""
      puts "The Elf with the most weight, carry #{bold(result)} lbs."
      puts ""
    end

    def subtotals
      read_file
        .map(&:to_i)
        .slice_before(0)
        .map(&:sum)
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
