#frozen_string_literals: true

module Day6
  class Part2
    attr_reader :file
    attr_accessor :result

    def initialize(file)
      @file = file
      @result = nil
    end
    
    def perform
      question
      extraction = []
      
      read_file.split('').each_with_index do |char, index|
        extraction = read_file.split('').slice(index, 14)
        if extraction.uniq.count.equal?(14)
          self.result = index + 14
          break
        end
      end

      output(result)
    end

    private

    def read_file
      @read_file ||= open_file.read
    end

    def open_file
      @open_file ||= File.open(File.dirname(__FILE__) + "/" + file)
    end

    def question
      puts ""
      puts "PART 2"
      puts ""
      puts "A start-of-message marker is just like a start-of-packet marker, except it consists of 14 distinct characters rather than 4."
      puts "How many characters need to be processed before the first start-of-packet marker is detected?"
    end

    def output(result)
      puts ""
      puts "#{bold(result)} characters need to be processed before the first start-of-packet marker was detected?."
      puts ""
    end

    def bold(input)
      "\033[1m#{input}\033[0m"
    end
  end
end
