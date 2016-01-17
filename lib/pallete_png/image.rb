require 'chunky_png'

module PalletePNG
  class Image
    NotPNG = Class.new StandardError

    # @return [ChunkyPNG::Image]
    attr_reader :image

    # @param [String] image_data The PNG image data
    # @raise [ChunkyPNG::SignatureMismatch] if image_data is not a PNG image
    def initialize(image_data)
      @image = ChunkyPNG::Image.from_blob(image_data)
    end

    # @return [String] The new image data that the color_mode is converted to TRUE COLOR alpha
    def to_truecolor_alpha
      image.to_blob color_mode: ChunkyPNG::COLOR_TRUECOLOR_ALPHA
    end

    def pallete_based?
      color_mode, _depth = image.palette.best_color_settings
      color_mode == ChunkyPNG::COLOR_INDEXED
    end

    def transparency_chunk?
      !datastream.transparency_chunk.nil?
    end

    # @return [ChunkyPNG::Datastream]
    def datastream
      @datastream ||= image.to_datastream
    end
  end
end
