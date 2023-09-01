require 'cloudinary'

Cloudinary.config_from_url("cloudinary://684211939381911:rD17sweXGrQEoLo2tR7E6RTL18A@dovxq5gn9")
Cloudinary.config do |config|
  config.secure = true
end