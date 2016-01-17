$:.unshift File.expand_path('../../lib', __FILE__)

require 'pallete_png'
require 'minitest/autorun'

module PalletePNG
  module TestHelpers
    def image_data(filename)
      image_path = File.join File.expand_path('../files', __FILE__), filename
      File.binread(image_path)
    end
  end
end
