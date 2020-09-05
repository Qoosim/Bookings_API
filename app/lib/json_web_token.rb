class JsonWebToken
  # secret to encode and decode token
  HMAC_SECRET = Rails.application.secrets.secret_key_base

  def self.encode(payload, exp = 24.hours.from_now)
    # set expiry to 24 hours from creation time
    payload[:exp] = exp.to_i
    # sign token with application secret
    # JWT.encode(payload, HMAC_SECRET) I changed HMAC_SECRET manually
    JWT.encode(payload, 'haywire')
  end

  def self.decode(token)
    # get payload; first index in decoded Array
    # body = JWT.decode(token, HMAC_SECRET)[0] I changed HMAC_SECRET manually
    body = JWT.decode(token, 'haywire')[0]
    HashWithIndifferentAccess.new body
    # rescue from all decode errors
  rescue JWT::DecodeError => e
    # raise custom error to be handled by custom handler
    raise ExceptionHandler::InvalidToken, e.message
  end
end
