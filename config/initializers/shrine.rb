require 'cloudinary'
require 'shrine/storage/cloudinary'

Cloudinary.config(
  cloud_name: Rails.application.credentials[:cloud_name].to_s,
  api_key: Rails.application.credentials[:cloud_api_key].to_s,
  api_secret: Rails.application.credentials[:cloud_api_secret].to_s
)

Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(prefix: 'test_app/cache'), # for direct uploads
  store: Shrine::Storage::Cloudinary.new(prefix: 'test_app')
}

Shrine.plugin :activerecord # loads Active Record Integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data # extracts metadata for assigned cached files
Shrine.plugin :validation_helpers
Shrine.plugin :validation
