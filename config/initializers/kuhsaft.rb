require 'kuhsaft'

Kuhsaft::ImageSize.build_defaults!
[
  [:small, 460, 690],
].each do |attrs|
  Kuhsaft::ImageSize.add(*attrs)
end
