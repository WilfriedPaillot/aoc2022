#frozen_string_literals: true

module Day4
  class Part1
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

        if element[0][0] >= element[1][0] && element[0][1] <= element[1][1]
          self.count += 1
        elsif element[1][0] >= element[0][0] && element[1][1] <= element[0][1]
          self.count += 1
        else
          next
        end
      end

      output(count)
    end

    private

    def question
      puts ""
      puts "In how many assignment pairs does one range fully contain the other?"
    end

    def output(result)
      puts ""
      puts "#{bold(result)} assignment pairs where a range contain the other"
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
