# frozen_string_literal: true
require 'pry'

# Day1 class represents the solution for Advent of Code Day 4
class Day4

  attr_reader :cards

  # Initializes a new instance of the Day1 class
  def initialize
    file_path = File.expand_path('input.csv', __dir__)
    input = File.read(file_path)
    @cards = input.split("\n")
  end



  def part_one
    cards.sum do |card|
      card = card.gsub(/Card \d+: /, '').split(' |')
      winners = card[0].split(' ')
      ours = card[1].split(' ')
      winning_numbers_count = (winners & ours).count

      score = winning_numbers_count > 0 ?  2**(winning_numbers_count - 1) : 0
      score.to_i
    end
  end

  def part_two

  end
end

# Create an instance of Day1
day4_instance = Day4.new

# Output the results of part_one and part_two
puts "Part One: #{day4_instance.part_one}"
# puts "Part Two: #{day1_instance.part_two}"
