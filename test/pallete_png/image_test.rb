require 'test_helper'

module PalletePNG
  class ImageTest < Minitest::Test
    include TestHelpers

    def test_init
      assert_raises ChunkyPNG::SignatureMismatch do
        Image.new image_data('not-a-png.jpg')
      end

      begin
        Image.new image_data('pallete-png-with-transparency.png')
      rescue ChunkyPNG::SignatureMismatch
        refute
      end
    end

    def test_pallete_based?
      image = Image.new image_data('pallete-png-with-transparency.png')
      assert image.pallete_based?

      image = Image.new image_data('not-a-pallete-png.png')
      refute image.pallete_based?
    end

    def test_transparency_chunk?
      image = Image.new image_data('pallete-png-with-transparency.png')
      assert image.transparency_chunk?

      image = Image.new image_data('pallete-png-without-transparency.png')
      refute image.transparency_chunk?
    end

    def test_to_truecolor_alpha
      image = Image.new image_data('pallete-png-with-transparency.png')

      datastream = ChunkyPNG::Datastream.from_blob image.to_truecolor_alpha
      assert_equal ChunkyPNG::COLOR_TRUECOLOR_ALPHA, datastream.header_chunk.color
    end
  end
end
