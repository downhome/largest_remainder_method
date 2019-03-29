require "largest_remainder_method/version"
require "largest_remainder_method/number"
require 'bigdecimal'

class LargestRemainderMethod
  class Error < StandardError; end

  class << self
    def round(numbers, precision)
      new(numbers, precision).call
    end
  end

  def initialize(numbers, precision)
    @precision_multiplier = 10 ** precision
    @numbers = numbers.map.with_index {|n, i| Number.new(index: i, value: n * @precision_multiplier) }
  end

  def call
    rounded.sort_by(&:index).map {|n| BigDecimal.new(n.value) / precision_multiplier }
  end

  private
  attr_reader :numbers, :precision_multiplier

  def rounded
    @rounded ||= sorted[0..round_up_count - 1].each(&:ceil!) + sorted[round_up_count..-1].each(&:floor!)
  end

  def round_up_count
    @round_up_count ||= (numbers.map(&:value).sum - numbers.map(&:floor).sum).ceil
  end

  def sorted
    @sorted ||= numbers.sort_by(&:diff)
  end

end
