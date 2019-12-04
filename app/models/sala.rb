class Sala
  include Mongoid::Document

  field :nombre, type: String

  belongs_to :user, required: false
  has_many :mensajes
  # accepts_nested_attributes_for :mensajes

end
