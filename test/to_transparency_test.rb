require 'test_helper'

module PalletePNG
  class ToTransparencyTest < Minitest::Test
    include TestHelpers

    def test_not_a_png
      assert_raises Image::NotPNG do
        PalletePNG.to_transparency image_data('not-a-png.jpg')
      end
    end

    def test_not_a_pallete_png
      raw_blob = image_data('not-a-pallete-png.png')
      assert_equal raw_blob, PalletePNG.to_transparency(raw_blob)
    end

    def test_pallete_png_without_transparency
      raw_blob = image_data('pallete-png-without-transparency.png')
      assert_equal raw_blob, PalletePNG.to_transparency(raw_blob)
    end

    def test_pallete_png_with_transparency
      raw_blob = image_data('pallete-png-with-transparency.png')
      result_blob = PalletePNG.to_transparency(raw_blob)

      refute_equal result_blob, raw_blob

      result_datastream = ChunkyPNG::Datastream.from_blob(result_blob)
      assert_equal ChunkyPNG::COLOR_TRUECOLOR_ALPHA, result_datastream.header_chunk.color
    end
  end
end
