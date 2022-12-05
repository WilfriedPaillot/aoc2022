#frozen_string_literals: true

module Day2
  class Part2
    attr_reader :file

    POINTS = {
      "X" => "1",
      "Y" => "2",
      "Z" => "3",
    }

    WIN_COMBINATIONS = {
      "Z" => "X",
      "Y" => "Z",
      "X" => "Y",
    }

    LOOSE_COMBINATIONS = {
      "Z" => "Y",
      "Y" => "X",
      "X" => "Z",
    }

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

        if combi[-1] == "Y"
          combi[-1] = combi[0]
          subtotal = 3 + POINTS[combi[-1]].to_i
          array << subtotal
        elsif combi[-1] == "X"
          combi[-1] = LOOSE_COMBINATIONS[combi[0]]
          subtotal = 0 + POINTS[combi[-1]].to_i
          array << subtotal
        elsif combi[-1] == "Z"
          combi[-1] = WIN_COMBINATIONS[combi[0]]
          subtotal = 6 + POINTS[combi[-1]].to_i
          array << subtotal
        end
      end

      output(array.sum)
    end

    def question
      puts ""
      puts "Following the Elf's instructions for the second column, what would your total score be if everything goes exactly according to your strategy guide?"
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
