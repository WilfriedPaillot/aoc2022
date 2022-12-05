#frozen_string_literals: true

class Launcher
  require_relative "lib/menu"
  
  def perform
    welcome
    menu
  end
  
  private
  
  def welcome
    puts ""
    puts ""
    puts "╔====================================╗"
    puts "║                                    ║"
    puts "║        Advent of Code 2022         ║"
    puts "║                                    ║"
    puts "║               by: Wilfried PAILLOT ║"
    puts "╚====================================╝"
    puts ""
    puts ""
  end

  def menu
    ::Lib::Menu.new.perform
  end

end

Launcher.new.perform