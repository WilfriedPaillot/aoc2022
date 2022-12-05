#frozen_string_literals: true

module Day2
  class Part1
    attr_reader :file

    POINTS = {
      "Y" => "2",
      "X" => "1",
      "Z" => "3",
    }

    WIN_COMBINATIONS = ["Z X", "Y Z", "X Y"]

    CORRESPONDANCE = {
      "A" => "X",
      "B" => "Y",
      "C" => "Z",
    }

    def initialize(file)
      @file = file
    end

    def perform
      question

      array = []
      read_file.map do |combi|
        combi[0] = CORRESPONDANCE[combi[0]]

        if WIN_COMBINATIONS.include?(combi)
          subtotal = 6 + POINTS[combi[-1]].to_i
          array << subtotal
        elsif equality(combi)
          subtotal = 3 + POINTS[combi[-1]].to_i
          array << subtotal
        else
          subtotal = 0 + POINTS[combi[-1]].to_i
          array << subtotal
        end
      end

      output(array.sum)
    end

    def equality(combi)
      combi[0] === combi[-1]
    end

    def question
      puts ""
      puts "What would your total score be if everything goes exactly according to your strategy guide?"
    end

    def output(result)
      puts ""
      puts "My score be #{bold(result)} with this strategy."
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
