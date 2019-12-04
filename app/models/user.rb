class User
  include Mongoid::Document
  # include Mongoid::ActiveRecordBridge
  include ActiveModel::SecurePassword

  has_secure_password
  field :password_digest, type: String
  field :email, type: String
  field :nombre, type: String

  has_many :salas
  has_many :mensajes

  validates :nombre, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true

end
