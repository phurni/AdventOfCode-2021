class SubmarinePosition
  attr_reader :horizontal, :depth

  def initialize
    @horizontal, @depth = 0, 0
  end

  def forward(value)
    @horizontal += value
  end

  def down(value)
    @depth += value
  end

  def up(value)
    @depth -= value
  end
end
