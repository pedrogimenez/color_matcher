Gem::Specification.new do |spec|
  spec.name                  = "color_matcher"
  spec.version               = "1.0.1"
  spec.date                  = "2015-04-20"
  spec.summary               = "Matches the nearest HEX color in a collection given a color"
  spec.description           = "Matches the nearest HEX color in a collection given a color"
  spec.authors               = ["Pedro Gimenez", "Juan Guerrero"]
  spec.email                 = ["pedro@chicisimo.com", "juan@chicisimo.com"]
  spec.files                 = Dir["lib/**/*.rb"] + Dir["spec/**/*.rb"]
  spec.homepage              = "http://github.com/chicisimo/color_matcher"
  spec.extra_rdoc_files      = ["README.md"]
  spec.required_ruby_version = ">= 2.1.0"
  spec.license               = "MIT"

  spec.add_development_dependency "rspec"
end
