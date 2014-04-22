Colors
======

[![Build Status](https://img.shields.io/travis/chicisimo/colors/master.svg)](https://travis-ci.org/chicisimo/colors)

Colors it's just a gem that returns the nearest HEX color in a collection given a color.

## How-to use it.

You should read the [tests](https://github.com/chicisimo/colors/blob/master/spec/matcher_spec.rb) as they are the most updated documentation.

Colors only exposes one static method:

```ruby
  Colors::Matcher.closest_color("000000", ["000000", "ffffff"]) # => 000000
```

## Color proximity

We know there are loads of better algorithms to deal with color proximity but we wanted to keep it simple for now. Anyway, feel free to send a pull-request if you have any suggestion or improvement :v:.
