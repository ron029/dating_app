class JsonWebToken
  require 'jwt'
  require 'active_support/core_ext/numeric/time'

  SECRET_KEY = 'asdf.@#4ASDFasdfsdu213412412342!@#'.freeze
  JWT_EXPIRY = 1.day

  def self.encode(payload, exp = JWT_EXPIRY.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY, 'HS256')
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY, true, { algorithm: 'HS256' })[0]
    res = HashWithIndifferentAccess.new decoded
    if Time.at(res[:exp]) > Time.now
      res
    else
      nil
    end
  rescue JWT::DecodeError, JWT::ExpiredSignature
    nil
  end
end
