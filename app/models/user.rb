class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  has_secure_password
  field :password_digest, type: String
  field :email, type: String
  field :nombre, type: String

  has_many :salas
  has_many :mensajes


end
