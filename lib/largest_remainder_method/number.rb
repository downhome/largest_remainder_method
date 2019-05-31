class Number
  attr_accessor :index, :value, :precision

  def initialize(index:, value:, precision:)
    @index = index
    @value = value
    @precision = precision
  end

  def ceil
    value.ceil(precision)
  end

  def ceil!
    self.value = ceil
  end

  def floor
    value.floor(precision)
  end

  def floor!
    self.value = floor
  end

  def diff
    (floor - value) * (10 ** precision)
  end
end
