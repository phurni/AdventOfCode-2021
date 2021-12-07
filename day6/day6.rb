# AOC-2021 Day 6 Part 1

fishes = ARGF.read.split(',').map(&:to_i)

1.upto(80) do
  fishes.map!(&:pred)
  new_fishes_count = fishes.count(-1)
  next if new_fishes_count == 0
  fishes.map! { |fish| fish < 0 ? 6 : fish }
  fishes.concat(Array.new(new_fishes_count, 8))
end

puts fishes.size
