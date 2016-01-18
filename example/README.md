# Example::Using in Prawn

Currently, [Prawn](https://github.com/prawnpdf/prawn) does not support a pallete-based PNG with transparency.

```ruby
Prawn::Document.generate 'result.pdf' do
  image 'images/pallete-based-w-transparency.png'
  # =>
  #   Pallete-based transparency in PNG is not currently supported.
  #   (Prawn::Errors::UnsupportedImageType)
end
```

But, you can draw the image using [PalletePNG](https://rubygems.org/gems/pallete_png) like below.

```ruby
require 'pallete_png'

Prawn::Document.generate 'result.pdf' do |doc|
  image_data = File.binread 'images/pallete-based-w-transparency.png'
  doc.image StringIO.new(PalletePNG.to_transparency(image_data))
end
```

## How to run

    $ bundle install
    $ bundle exec ruby prawn_image.rb
