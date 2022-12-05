#frozen_string_literals: true

module Day1
  class Part2
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def perform
      question
      output(subtotals.max(3).sum)
    end

    private

    def question
      puts ""
      puts "Find the top three Elves carrying the most Calories. How many Calories are those Elves carrying in total?"
    end

    def output(result)
      puts ""
      puts "The 3 Elves with the most weight, carry #{bold(result)} lbs."
      puts ""
    end

    def subtotals
      read_file.slice_before(0).map(&:sum)
    end

    def bold(input)
      "\033[1m#{input}\033[0m"
    end

    def read_file
      @read_file ||= open_file.readlines.map(&:chomp).map(&:to_i)
    end

    def open_file
      @open_file ||= File.open(File.dirname(__FILE__) + "/#{file}")
    end
  end
end
