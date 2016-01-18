require 'prawn'
require 'pallete_png'

Prawn::Document.generate 'result.pdf' do |pdf|
  image_data = File.read 'images/pallete-based-w-transparency.png'

  # If you draw the original image, you will get the following Prawn's error:
  # pdf.image 'images/pallete-based-w-transparency.png'
  #
  #   Pallete-based transparency in PNG is not currently supported.
  #   (Prawn::Errors::UnsupportedImageType)

  pdf.image StringIO.new(PalletePNG.to_transparency(image_data))
end
