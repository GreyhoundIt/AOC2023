# frozen_string_literal: true
require 'pry'

# Day1 class represents the solution for Advent of Code Day 1
class Day1
  # TRANSLATIONS hash maps spelled-out numbers to their numeric representation
  TRANSLATIONS = {
    'one' => 'one1one',
    'two' => 'two2two',
    'three' => 'three3three',
    'four' => 'four4four',
    'five' => 'five5five',
    'six' => 'six6six',
    'seven' => 'seven7seven',
    'eight' => 'eight8eight',
    'nine' => 'nine9nine'
  }.freeze

  attr_reader :calibration_lines

  # Initializes a new instance of the Day1 class
  def initialize
    file_path = File.expand_path('input.csv', __dir__)
    input = File.read(file_path)
    @calibration_lines = input.split("\n")
  end

  # Calculates the sum of the real first and last digits on each line
  #
  # @param lines [Array<String>] An array of strings representing lines
  # @return [Integer] The sum of the real first and last digits on each line
  def sum_of_values(lines)
    lines.sum do |line|
      numbers = line.scan(/\d/)
      ((numbers.first) + (numbers.last || numbers.first)).to_i
    end
  end

  # Translates an array of lines using the translate_line method
  #
  # @param lines [Array<String>] An array of strings representing lines
  # @return [Array<String>] An array of translated lines
  def translate_lines(lines)
    lines.map(&method(:translate_line))
  end

  # Translates a single line using the TRANSLATIONS hash
  #
  # @param line [String] A string representing a line
  # @return [String] The translated line
  def translate_line(line)
    TRANSLATIONS.inject(line) { |result, (key, value)| result.gsub(/#{key}/, value) }
  end

  # Calculates the sum of the real first and last digits for an array of lines
  #
  # @return [Integer] The sum of the real first and last digits for the given lines
  def part_one
    sum_of_values(calibration_lines)
  end

  # Translates each line using the TRANSLATIONS hash and calculates the sum
  #
  # @return [Integer] The sum of the real first and last digits for the translated lines
  def part_two
    translated_lines = translate_lines(calibration_lines)
    sum_of_values(translated_lines)
  end
end

# Create an instance of Day1
day1_instance = Day1.new

# Output the results of part_one and part_two
puts "Part One: #{day1_instance.part_one}"
puts "Part Two: #{day1_instance.part_two}"
