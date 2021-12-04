# AOC-2021 Day 2 Part 1

# Based on the quick and dirty version, reduce SLOC (only for fun, no profit!)
commands = ARGF.readlines
sum_command_values = lambda { |commands, command_name| commands.grep(/#{command_name}/) { |command| command[/\d+/].to_i }.sum }
puts sum_command_values.call(commands, "forward") * (sum_command_values.call(commands, "down") - sum_command_values.call(commands, "up"))
