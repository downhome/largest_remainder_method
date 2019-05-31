RSpec.describe LargestRemainderMethod do
  Cases = {
    numbers: [20.958083832335326, 22.75449101796407, 18.562874251497007, 18.562874251497007, 19.161676646706585],
    case: [
      { precision: 0, rounded: [21, 23, 19, 18, 19]},
      { precision: 1, rounded: [20.9, 22.7, 18.6, 18.6, 19.2]},
      { precision: 2, rounded: [20.96, 22.76, 18.56, 18.56, 19.16]},
      { precision: 5, rounded: [20.95808, 22.75449, 18.56288, 18.56287, 19.16168]},
    ]
  }

  Cases[:case].each do |result|
    it "rounds for precision: #{result[:precision]} " do
      expect(described_class.round(Cases[:numbers], precision: result[:precision])).to eq(result[:rounded])
      expect(described_class.round(Cases[:numbers], precision: result[:precision]).sum).to eq(result[:rounded].sum)
    end
  end
end
