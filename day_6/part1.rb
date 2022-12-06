#frozen_string_literals: true

module Day6
  class Part1
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
        extraction = read_file.split('').slice(index, 4)
        if extraction.uniq.count.equal?(4)
          self.result = index + 4
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
      puts "PART 1"
      puts ""
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
