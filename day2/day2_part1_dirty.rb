# AOC-2021 Day 2 Part 1

# Quick and dirty method: Don't follow the planned course, compute strait up the final values which are:
# - horizontal: sum up all 'forward' commands
# - depth: sum up all 'down' commands and subtract it with the sum of all 'up' commands

def sum_command_values(commands, command_name)
  commands.grep(/#{command_name}/) { |command| command[/\d+/].to_i }.sum
end

commands = ARGF.readlines

horizontal_position = sum_command_values(commands, "forward")
depth_position = sum_command_values(commands, "down") - sum_command_values(commands, "up")

puts horizontal_position * depth_position
