# AOC-2021 Day 2 both parts

# only the SubmarinePosition class differs between part 1 and 2. Load the appropriate one chosen from command line arg: -2 for second part
require_relative ARGV.delete('-2') ? 'submarine_position_part2' : 'submarine_position_part1'

commands = ARGF.readlines.map { |command| command.match(/(?<cmd>\w+)\s+(?<value>\d+)/) { |groups| [groups[:cmd], groups[:value].to_i] } }
position = commands.each_with_object(SubmarinePosition.new) { |command, position| position.send(*command) }
puts position.horizontal * position.depth
