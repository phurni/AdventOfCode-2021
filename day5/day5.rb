# AOC-2021 Day 5 both parts

class Map
  def initialize
    @storage = Hash.new { |hash, key| hash[key] = [] }
  end

  def draw_point(x, y)
    @storage[y][x] = (@storage[y][x] || 0 ) + 1
  end

  def draw_horizontal_line(x_range, y)
    x_range.each { |x| draw_point(x, y) }
  end

  def draw_vertical_line(x, y_range)
    y_range.each { |y| draw_point(x, y) }
  end

  def draw_diagonal_line(x, y, steps, x_delta, y_delta)
    steps.times do
      draw_point(x, y)
      x += x_delta
      y += y_delta
    end
  end

  def point_count_matching(&block)
    @storage.values.flatten.compact.count(&block)
  end
end

handle_diagonals = ARGV.delete('-2')
segments = ARGF.readlines.map { |line| line.match(/(\d+),(\d+) -> (\d+),(\d+)/).captures.map(&:to_i) }

map = segments.each_with_object(Map.new) do |segment, map|
  if segment[0] == segment[2]
    map.draw_vertical_line(segment[0], Range.new(*[segment[1], segment[3]].sort))
  elsif segment[1] == segment[3]
    map.draw_horizontal_line(Range.new(*[segment[0], segment[2]].sort), segment[1])
  elsif handle_diagonals && (segment[0]-segment[2]).abs == (segment[1]-segment[3]).abs
    map.draw_diagonal_line(segment[0], segment[1], (segment[0]-segment[2]).abs+1, segment[2] <=> segment[0], segment[3] <=> segment[1])
  end
end

puts map.point_count_matching { |point| point > 1 }
