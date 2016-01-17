require 'pallete_png/version'
require 'pallete_png/image'

module PalletePNG
  # @param [String] image_data The PNG image data
  # @return [String] The PNG image data
  # @raise [PalletePNG::Image::NotPNG] if image_data is not a PNG image
  # @example
  #   image_data = PalletePNG.to_transparency File.binread('pallete-based-w-transparency.png')
  def self.to_transparency(image_data)
    begin
      image = Image.new image_data
    rescue ChunkyPNG::SignatureMismatch
      raise Image::NotPNG
    end

    # Returns the raw image data if image is not a pallete-based PNG with transparency
    return image_data unless image.pallete_based? && image.transparency_chunk?

    image.to_truecolor_alpha
  end
end
