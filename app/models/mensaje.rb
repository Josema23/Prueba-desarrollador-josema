class Mensaje
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :cuerpo, type: String

  belongs_to :user, foreign_key: :user_id
  belongs_to :sala, foreign_key: :sala_id
end
