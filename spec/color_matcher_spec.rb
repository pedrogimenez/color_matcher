require "color_matcher"

describe ColorMatcher do
  it "matches an exact hex color" do
    match = ColorMatcher.closest_color("000000", ["000000", "000001"])
    expect(match).to eq("000000")
  end

  it "matches to the closest color" do
    match = ColorMatcher.closest_color("fffff1", ["000001", "000002", "ffffff"])
    expect(match).to eq("ffffff")

    match = ColorMatcher.closest_color("000000", ["ffffff"])
    expect(match).to eq("ffffff")

    match = ColorMatcher.closest_color("fe0e00", ["33cc00", "fe0000"])
    expect(match).to eq("fe0000")

    match = ColorMatcher.closest_color("cdf200", ["33cc00", "867f86"])
    expect(match).to eq("33cc00")
  end

  it "returns nil when an empty collection is given" do
    match = ColorMatcher.closest_color("cdf200", [])
    expect(match).to be_nil
  end

  it "returns nil when an empty color is given" do
    match = ColorMatcher.closest_color("", ["000000", "ffffff"])
    expect(match).to be_nil
  end
end
