require "colors"

describe "matcher" do
  it "matches an exact hex color" do
    match = Colors::Matcher.closest_color("000000", ["000000", "000001"])
    expect(match).to eq("000000")
  end

  it "matches to the closest color" do
    match = Colors::Matcher.closest_color("000000", ["000001", "000002", "ffffff"])
    expect(match).to eq("000001")

    match = Colors::Matcher.closest_color("000000", ["ffffff"])
    expect(match).to eq("ffffff")
  end
end
