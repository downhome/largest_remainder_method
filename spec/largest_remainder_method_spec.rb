RSpec.describe LargestRemainderMethod do
  let :cases do
    {
      numbers: [20.958083832335326, 22.75449101796407, 18.562874251497007, 18.562874251497007, 19.161676646706585],
      totals: [
        { precision: 0, total: 100}
      ]
    }
  end

  it "has a version number" do
    cases[:results].each do |result|
      expect(described_class.round(cases[:numbers], result[:precision])).to eq(result[:total])
    end
  end

end
