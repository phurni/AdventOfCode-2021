# AOC-2021 Day 3 Part 2

measures_as_binary_digits = ARGF.readlines(chomp: true).map { |binary_string| binary_string.chars.map(&:to_i) }

def find_rating_for_common(remaining_binary_digits, wanted_common_value)
  0.upto(100) do |bit_position|
    most_common_value = (remaining_binary_digits.reduce(0) { |memo, binary_digits| memo + binary_digits[bit_position] } * 2) >= remaining_binary_digits.size ? 1 : 0
    common_value = (1 - wanted_common_value) ^ most_common_value
    remaining_binary_digits = remaining_binary_digits.select { |binary_digits| binary_digits[bit_position] == common_value }
    break if remaining_binary_digits.size == 1
  end
  remaining_binary_digits.first.join.to_i(2)
end

oxygen = find_rating_for_common(measures_as_binary_digits, 1)
co2    = find_rating_for_common(measures_as_binary_digits, 0)
puts oxygen * co2
