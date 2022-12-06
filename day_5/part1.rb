#frozen_string_literals: true

module Day5
  class Part1
    attr_reader :file

    def initialize(file)
      @file = file
    end
    
    def perform
      question
      
      supplies =
      [
        ["B", "P", "N", "Q", "H", "D", "R", "T"],
        ["W", "G", "B", "J", "T", "V"],
        ["N", "R", "H", "D", "S", "V", "M", "Q"],
        ["P", "Z", "N", "M", "C"],
        ["D", "Z", "B"],
        ["V", "C", "W", "Z"],
        ["G", "Z", "N", "C", "V", "Q", "L", "S"],
        ["L", "G", "J", "M", "D", "N", "V"],
        ["T", "P", "M", "F", "Z", "C", "G"],
      ]
      
      extract_values.each do |values|
        nbr, source, destination  = values[0], values[1], values[2]

        cut = supplies[source - 1].pop(nbr).reverse
        supplies[destination - 1].push(cut).flatten!
      end

      result = supplies[0..-1].map { |supply| supply[-1] }.join

      output(result)
    end

    private

    def extract_values
      read_file.map do |line|
        line.scan(/\d+/).map(&:to_i)
      end
    end

    def question
      puts ""
      puts "PART 1"
      puts ""
      puts "After the rearrangement procedure completes, what crate ends up on top of each stack?"
    end

    def output(result)
      puts ""
      puts "#{bold(result)} are the latest crates of each stack."
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
