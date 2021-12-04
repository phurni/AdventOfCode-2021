class SubmarinePosition
  attr_reader :horizontal, :depth

  def initialize
    @horizontal, @depth, @aim = 0, 0, 0
  end

  def forward(value)
    @horizontal += value
    @depth += @aim * value
  end

  def down(value)
    @aim += value
  end

  def up(value)
    @aim -= value
  end
end
