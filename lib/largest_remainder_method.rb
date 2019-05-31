require "largest_remainder_method/version"
require "largest_remainder_method/number"
require 'bigdecimal'

class LargestRemainderMethod
  class Error < StandardError; end

  class << self
    def round(numbers, precision: )
      new(numbers, precision).call
    end
  end

  def initialize(numbers, precision)
    @numbers = numbers.map.with_index {|n, i| Number.new(index: i, value: n, precision: precision) }
  end

  def call
    rounded.sort_by(&:index).map(&:value)
  end

  private
  attr_reader :numbers

  def rounded
    @rounded ||= sorted.take(round_up_count).each(&:ceil!) + sorted.drop(round_up_count).each(&:floor!)
  end

  def round_up_count
    @round_up_count ||= numbers.map(&:diff).sum.abs.ceil
  end

  def sorted
    @sorted ||= numbers.sort_by(&:diff)
  end
end
