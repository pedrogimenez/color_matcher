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
      color_first_byte, color_second_byte, color_third_byte = split_color(color)
      collection_color_first_byte, collection_color_second_byte, collection_color_third_byte = split_color(collection_color)

      first_byte_proximity  = color_first_byte - collection_color_first_byte
      second_byte_proximity = color_second_byte - collection_color_second_byte
      third_byte_proximity  = color_third_byte - collection_color_third_byte

      first_byte_proximity.abs + second_byte_proximity.abs + third_byte_proximity.abs
    end

    def split_color(color)
      first_part  = (color[0] + color[1]).to_i(16)
      second_part = (color[2] + color[3]).to_i(16)
      third_part  = (color[4] + color[5]).to_i(16)

      [first_part, second_part, third_part]
    end

    private_class_method :proximity_of, :split_color
  end
end
