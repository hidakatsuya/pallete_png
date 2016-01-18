lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)
require 'pallete_png/version'

Gem::Specification.new do |spec|
  spec.name          = 'pallete_png'
  spec.version       = PalletePNG::VERSION
  spec.authors       = ['Katsuya HIDAKA']
  spec.email         = ['hidakatsuya@gmail.com']

  spec.summary       = 'Make it possible to render the transparent of a pallete-based PNG in PDF'
  spec.description   = <<-DESC
    PalletePNG is a pure-ruby library that make it possible to render
    the transparent of a pallete-based PNG in PDF by converting the color-mode of the image.
  DESC
  spec.homepage      = 'https://github.com/hidakatsuya/pallete_png'
  spec.license       = 'MIT'
  spec.platform      = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.2'

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test}/*`.split("\n")
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'chunky_png', '~> 1.3.0'

  spec.add_development_dependency 'bundler', '>= 1.0.0'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rr'
end
