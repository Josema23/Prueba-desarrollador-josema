class Mensaje
  include Mongoid::Document
  field :cuerpo, type: String

  belongs_to :user
  belongs_to :sala
end
