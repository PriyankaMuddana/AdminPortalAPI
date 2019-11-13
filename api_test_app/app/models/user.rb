class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  has_secure_password

  field :email,              type: String
  field :gender,             type: String, default: 'Male'
  field :disabled,           type: Boolean, default: false
  field :last_name,          type: String
  field :first_name,         type: String
  field :password_digest,    type: String

  validates_presence_of :email, :gender, :password, :first_name, :last_name
  validates :gender, inclusion: { in: %w(Male Female) }

  has_many :tags

  default_scope { where(disabled: false) }

  def as_json(*)
  	super.except('password_digest')
  end
end
