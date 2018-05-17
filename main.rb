require 'colorize'
require_relative 'git'

class Main
  include Git
  
  def self.menu
    puts 'MAIN MENU'.colorize(:cyan)
    puts '1: Enter git command'.colorize(:cyan)
    puts '2: Exit'.colorize(:cyan)
    choice = gets.to_i
    case choice
    when 1
      puts 'Enter git command'.colorize(:green)
      Git.puts_git(gets.strip)
    when 2
      exit
    else
      puts 'Invalid choice'.colorize(:red)
    end

    menu
  end

end

MAIN.menu

def puts_git(cmd)
  puts `git #{cmd} -h`
  menu
end

def menu
  puts '1: Enter git command'
  puts '2: Exit'
  choice = gets.to_i
  case choice
  when 1
    puts 'Enter git command'
    puts_git(gets.strip)
    menu
  when 2
    exit
  else
    puts 'Invalid choice'
    menu
  end
end

menu
