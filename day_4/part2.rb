#frozen_string_literals: true

module Day4
  class Part2
    attr_reader :file
    attr_accessor :count

    def initialize(file)
      @file = file
      @count = 0
    end

    def perform
      question

      input = read_file

      input.each do |element|
        element = element.split(",")
        element[0] = element[0].split("-").map(&:to_i)
        element[1] = element[1].split("-").map(&:to_i)

        range1 = (element[0][0]..element[0][1]).to_a
        range2 = (element[1][0]..element[1][1]).to_a

        range1.each do |num|
          if range2.include?(num)
            self.count += 1
            break
          end
        end
      end

      output(count)
    end

    private

    def question
      puts ""
      puts "In how many assignment pairs do the ranges overlap?"
    end

    def output(result)
      puts ""
      puts "#{bold(result)} assignment pairs where the ranges overlap"
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
