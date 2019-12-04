class Mensaje
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :cuerpo, type: String

  validates :cuerpo, presence: true

  belongs_to :user, required: false
  belongs_to :sala, required: false

end
