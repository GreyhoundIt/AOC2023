# frozen_string_literal: true
require 'pry'

# Day1 class represents the solution for Advent of Code Day 2
class Day2

  attr_reader :games

  POSSIBLE =
    {
      'reds' => 12,
      'greens' => 13,
      'blues' => 14
    }.freeze

  # Initializes a new instance of the Day1 class
  def initialize
    file_path = File.expand_path('input.csv', __dir__)
    input = File.read(file_path)
    @games = input.split("\n")
  end

  def part_one
    sum = 0
    games.each_with_index do |game, index|
      id = index + 1

      highest_values = {
        'reds' => 0,
        'greens' => 0,
        'blues' => 0
      }

      views = game.gsub(/Game \d+: /, '').split(';')
      views.each do |view|
        reds = view.match(/(?<reds>\d+) red/)
        greens = view.match(/(?<greens>\d+) green/)
        blues = view.match(/(?<blues>\d+) blue/)

        highest_values['reds'] = [reds[:reds].to_i, highest_values['reds']].max if reds
        highest_values['greens'] = [greens[:greens].to_i, highest_values['greens']].max if greens
        highest_values['blues'] = [blues[:blues].to_i, highest_values['blues']].max if blues
      end

      all_below_possible = highest_values.all? { |color, value| value <= POSSIBLE[color] }
      sum += id if all_below_possible
    end
    sum
  end


  def part_two
    sum = 0
    games.each_with_index do |game, index|
      id = index + 1

      highest_values = {
        'reds' => 0,
        'greens' => 0,
        'blues' => 0
      }

      views = game.gsub(/Game \d+: /, '').split(';')
      views.each do |view|
        reds = view.match(/(?<reds>\d+) red/)
        greens = view.match(/(?<greens>\d+) green/)
        blues = view.match(/(?<blues>\d+) blue/)

        highest_values['reds'] = [reds[:reds].to_i, highest_values['reds']].max if reds
        highest_values['greens'] = [greens[:greens].to_i, highest_values['greens']].max if greens
        highest_values['blues'] = [blues[:blues].to_i, highest_values['blues']].max if blues
      end
      sum += highest_values.values.inject { |sum, n| sum * n}
    end
    sum
  end



end

day2_instance = Day2.new

# Output the results of part_one and part_two
puts "Part One: #{day2_instance.part_one}"
puts "Part One: #{day2_instance.part_two}"