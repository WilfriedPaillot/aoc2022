#frozen_string_literals: true
module Lib
  class Menu
    def perform
      display_choices
      run_day(get_choice)
      back_to_menu
    end

    private

    def run_day(choice)
      case choice
      when 0
        say_goodbye
        exit
      when 1..Dir.glob("day*").length
        Dir.glob("day_#{choice}/*.rb").each do |file|
          require_relative "../" + file

          module_name = file.gsub("_", "").split("/").first.capitalize
          class_name = file.gsub(".rb", "").split("/").last.capitalize
          path = "::" + module_name + "::" + class_name

          Object.const_get(path).new("input.txt").perform
        end
      else
        puts "Sorry, I don't know this day"
      end
    end

    def get_choice
      print "Enter your choice: "
      gets.chomp.to_i
    end

    def display_choices
      puts "List of available days:"
      puts "========================"
      Dir.glob("day*").each_with_index do |day, index|
        puts "#{index + 1} - #{day.capitalize.gsub("_", " ")} "
      end
      puts ""
      puts "0 - Quit"
      puts "========================"
    end

    def back_to_menu
      puts ""
      puts "Press ENTER to back to menu"
      gets
      system "clear"
      perform
    end

    def say_goodbye
      puts ""
      puts "Thanks for your visit"
      puts "Don't forget to star the repo"
      puts "See you soon on Linkedin"
      puts ""
    end
  end
end
