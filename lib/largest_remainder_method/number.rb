class Number < Struct.new(:index, :value, :floor, :diff, keyword_init: true)
  def ceil
    @ceil ||= value.ceil
  end

  def ceil!
    self.value = ceil
  end

  def floor
    @floor ||= value.floor
  end

  def floor!
    self.value = floor
  end

  def diff
    @diff ||= value.floor - value
  end
end
