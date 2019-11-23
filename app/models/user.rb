class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  has_secure_password
  field :nombre, type: String
  field :email, type: String
  field :password_digest, type: String

  has_many :salas
  has_many :messages

end
