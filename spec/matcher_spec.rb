require "colors"

describe "matcher" do
  it "matches an exact hex color" do
    match = Colors::Matcher.closest_color("000000", ["000000", "000001"])
    expect(match).to eq("000000")
  end

  it "matches to the closest color" do
    match = Colors::Matcher.closest_color("fffff1", ["000001", "000002", "ffffff"])
    expect(match).to eq("ffffff")

    match = Colors::Matcher.closest_color("000000", ["ffffff"])
    expect(match).to eq("ffffff")

    match = Colors::Matcher.closest_color("fe0e00", ["33cc00", "fe0000"])
    expect(match).to eq("fe0000")

    match = Colors::Matcher.closest_color("cdf200", ["33cc00", "867f86"])
    expect(match).to eq("33cc00")
  end
end
