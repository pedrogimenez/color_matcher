module Colors
  module Matcher
    extend self

    Match = Struct.new(:color, :proximity)

    def closest_color(color, collection)
      matches = collection.map do |collection_color|
        Match.new(collection_color, proximity_of(color, collection_color))
      end

      matches.min_by { |match| match[:proximity] }.color
    end

    def proximity_of(color, collection_color)
      color_red, color_green, color_blue = split_color(color)
      collection_color_red, collection_color_green, collection_color_blue = split_color(collection_color)

      color_red_mean = (color_red + collection_color_red) / 2
      color_red_gap  = color_red - collection_color_red
      color_green_gap = color_green - collection_color_green
      color_blue_gap  = color_blue - collection_color_blue

      euclidean_distance(color_red_mean, color_red_gap, color_green_gap, color_blue_gap)
    end

    def split_color(color)
      first_part  = (color[0] + color[1]).to_i(16)
      second_part = (color[2] + color[3]).to_i(16)
      third_part  = (color[4] + color[5]).to_i(16)

      [first_part, second_part, third_part]
    end

    def euclidean_distance(red_mean, red_gap, green_gap, blue_gap)
      Math.sqrt((((512 + red_mean) * red_gap ** 2) >> 8) + 4 * green_gap ** 2 + (((767 - red_mean) * blue_gap ** 2) >> 8));
    end

    private_class_method :proximity_of, :split_color, :euclidean_distance
  end
end
