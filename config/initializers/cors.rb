# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins 'http://localhost:8080'  # Replace with the actual allowed origin(s)
#     resource '*',
#       headers: :any,
#       methods: %i[get post put patch delete options head],
#       credentials: true,
#       expose: %w[Authorization],
#       max_age: 600
#   end
# end
