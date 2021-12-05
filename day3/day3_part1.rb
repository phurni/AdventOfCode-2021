# AOC-2021 Day 3 Part 1

# each line is split in chars converted to integers, reduce them by adding each value position wise (array-member wise)
# the final memo has the count of set (1) bit of each bit position.
measures = ARGF.readlines(chomp: true)
bit_counts = measures.map { |binary_string| binary_string.chars.map(&:to_i) }.reduce { |memo, binary_array| memo.zip(binary_array).map(&:sum) }

# convert the final bit_counts: bit set when count is "the more common" which it is when there are more than half the values (bit clear when "less common")
# epsilon is the 1-complement of gamma but for this we should store an intermediate result. I decide to "stick" to the challenge definition and compute it completely.
gamma   = bit_counts.map { |count| count > measures.size / 2 ? 1 : 0 }.join.to_i(2)
epsilon = bit_counts.map { |count| count > measures.size / 2 ? 0 : 1 }.join.to_i(2)

puts gamma * epsilon
