# AOC-2021 Day 4 Part 1

class Board
  WIDTH = 5
  HEIGHT = 5

  def initialize(numbers)
    @numbers = numbers
  end

  def draw(number)
    if index = numbers.find_index(number)
      numbers[index] = nil
    end
  end

  def won?
    lines.any? { |line| line.compact.empty? } || columns.any? { |column| column.compact.empty? }
  end

  def unmarked_numbers
    numbers.compact
  end

  private

  attr_reader :numbers

  def lines
    numbers.each_slice(WIDTH)
  end

  def columns
    lines.to_a.transpose
  end
end

numbers_to_draw = ARGF.readline.split(',').map(&:to_i)
boards = ARGF.read.split.map(&:to_i).each_slice(Board::WIDTH * Board::HEIGHT).map { |numbers| Board.new(numbers) }

winner, number = numbers_to_draw.detect do |number|
  boards.each { |board| board.draw(number) }
  winner = boards.find { |board| board.won? }
  break [winner, number] if winner
end

puts winner.unmarked_numbers.sum * number
