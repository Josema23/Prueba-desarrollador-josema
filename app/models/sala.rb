class Sala
  include Mongoid::Document
  field :nombre, type: String

  belongs_to :user
  has_many :messages

end
