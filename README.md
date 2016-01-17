# PalletePNG

[![Gem Version](https://badge.fury.io/rb/pallete_png.svg)](https://badge.fury.io/rb/pallete_png)
[![Build Status](https://travis-ci.org/hidakatsuya/pallete_png.svg?branch=master)](https://travis-ci.org/hidakatsuya/pallete_png)

PalletePNG is a pure-ruby library that makes a pallete-based PNG transparency.

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

image_data = File.binread('/path/to/pallete-based-w-transparency.png')

PalletePNG.to_transparency(image_data) # => The converted image data
```

## Supported versions

Ruby 2.2, 2.3

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hidakatsuya/transparency_png.

## License

© 2016 Katsuya HIDAKA. See MIT-LICENSE for further details.
