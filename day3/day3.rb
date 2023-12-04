# frozen_string_literal: true
require 'pry'
require 'set'

# Day3 class represents the solution for Advent of Code Day 3
class Day3
  attr_reader :lines

  # Initializes a new instance of the Day3 class
  def initialize
    file_path = File.expand_path('input.csv', __dir__)
    input = File.read(file_path)
    @lines = input.split("\n")
  end

  # def part_one
  #   symbols = []
  #
  #   lines.each_with_index do |row, x|
  #     row.each_char.with_index do |char, y|
  #       next if char == '.'
  #       next if char =~ /\d/
  #
  #       symbols << [x, y]
  #     end
  #   end
  #   p symbols
  #
  #   number_locations = []
  #   symbols.each do |(x, y)|
  #     [
  #       [-1, -1],
  #       [-1, 0],
  #       [-1, 1],
  #       [0, -1],
  #       [0, 0],
  #       [0, 1],
  #       [1, -1],
  #       [1, 0],
  #       [1, 1]
  #     ].each do |(dx, dy)|
  #       nx = x + dx
  #       ny = y + dy
  #       if lines[nx] && lines[nx][ny] =~ /\d/
  #         number_locations << [nx, ny]
  #       end
  #     end
  #   end
  #   p number_locations
  #
  #   start_number_index = Set.new
  #   number_locations.each do |(x, y)|
  #     while lines[x][y - 1] =~ /\d/
  #       y -= 1
  #     end
  #     start_number_index << [x, y]
  #   end
  #   p start_number_index
  #
  #   start_number_index.map { |(x, y)| lines[x][y..] }.map(&:to_i).sum
  # end

  def part_two
    symbols = []
    sum = 0
    lines.each_with_index do |row, x|
      row.each_char.with_index do |char, y|
        symbols << [x, y] if char == '*'
      end
    end
    p symbols


    symbols.each do |(x, y)|
      number_locations = []
      start_number_index = Set.new
      [
        [-1, -1],
        [-1, 0],
        [-1, 1],
        [0, -1],
        [0, 0],
        [0, 1],
        [1, -1],
        [1, 0],
        [1, 1]
      ].each do |(dx, dy)|
        nx = x + dx
        ny = y + dy
        if lines[nx] && lines[nx][ny] =~ /\d/
          number_locations << [nx, ny]
        end
      end

      number_locations.each do |(x, y)|
        while lines[x][y - 1] =~ /\d/
          y -= 1
        end
        start_number_index << [x, y]
      end
      p start_number_index
      if start_number_index.length == 2
        result = start_number_index.map do |(x, y)|
          lines[x][y..].to_i
        end.inject(:*)
      end
      sum += result.to_i
    end
    p sum
  end

end

day3_instance = Day3.new

# Output the results of part_one and part_two
# puts "Part One: #{day3_instance.part_one}"
puts "Part Two: #{day3_instance.part_two}"
