require 'rails_helper'

RSpec.describe Mensaje, type: :model do
  context 'validation tests' do
    it 'should save succesfully' do
      mensaje = Mensaje.new(cuerpo: 'Probando', user_id: '1234567', sala_id: '8919').save
      expect(mensaje).to eq(true)
    end
  end
end
