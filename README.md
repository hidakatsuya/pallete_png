# PalletePNG

[![Gem Version](https://badge.fury.io/rb/pallete_png.svg)](https://badge.fury.io/rb/pallete_png)
[![Build Status](https://travis-ci.org/hidakatsuya/pallete_png.svg?branch=master)](https://travis-ci.org/hidakatsuya/pallete_png)

PalletePNG is a pure-ruby library that make it possible to render the transparent of a pallete-based PNG in PDF by converting the color-mode of the image.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pallete_png'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pallete_png

## Usage

```ruby
require 'pallete_png'

image = File.binread('/path/to/pallete-based-w-transparency.png')
converted_image = PalletePNG.to_transparency(image)
```

### Exception

```ruby
require 'pallete_png'

not_a_png_image = File.binread('/path/to/not_a_png.jpg')

begin
  converted_image = PalletePNG.to_transparency(not_a_png_image)
rescue PalletePNG::Image::NotPNG
  puts 'The image is not a PNG.'
end
```

### Use with Prawn

See [Example::Using in Prawn](https://github.com/hidakatsuya/pallete_png/tree/master/example).

## Supported versions

Ruby 2.2, 2.3

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hidakatsuya/pallete_png.

## License

© 2016 Katsuya HIDAKA. See MIT-LICENSE for further details.
