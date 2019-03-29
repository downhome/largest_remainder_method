class Number < Struct.new(:index, :value, :precision, keyword_init: true)
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
