# jwt_test.rb

# Load dependencies
require 'jwt'
require 'active_support/all'
require_relative 'json_web_token'  # Adjust the path to your JsonWebToken class if needed

# Set up a sample payload
payload = { user_id: 123 }

# Encode the payload
encoded_token = JsonWebToken.encode(payload)
puts "Encoded Token: #{encoded_token}"

# Decode the token
decoded_payload = JsonWebToken.decode(encoded_token)
puts "Decoded Payload: #{decoded_payload}"

# Attempt to decode an invalid token
invalid_token = 'invalid.token.here'
begin
  decoded_invalid = JsonWebToken.decode(invalid_token)
  puts "Decoded Invalid: #{decoded_invalid}"
rescue JWT::DecodeError => e
  puts "Error Decoding Invalid Token: #{e.message}"
end

# Attempt to decode an expired token
expired_token = JsonWebToken.encode({ user_id: 456 }, Time.now - 1.hour)
begin
  decoded_expired = JsonWebToken.decode(expired_token)
  puts "Decoded Expired: #{decoded_expired}"
rescue JWT::ExpiredSignature => e
  puts "Error Decoding Expired Token: #{e.message}"
end
