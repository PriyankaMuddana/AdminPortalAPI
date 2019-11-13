class JwtBlacklist
  include Mongoid::Document
  include Devise::JWT::RevocationStrategies::Blacklist

  field :jti, type: String
  field :exp, type: Time

  index({jti: 1}, {unique: true, background: true})
end
