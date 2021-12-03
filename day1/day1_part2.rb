# AOC-2021 Day 1 Part 2
puts ARGF.readlines.map(&:to_i).each_cons(3).map(&:sum).each_cons(2).count { |a, b| a < b }
