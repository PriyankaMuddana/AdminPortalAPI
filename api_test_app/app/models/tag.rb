class Tag
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :system, type: Boolean, default: false

  validates_presence_of :name

  belongs_to :user, optional: true
end