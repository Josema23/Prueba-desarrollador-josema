require 'rails_helper'

RSpec.describe Sala, type: :model do
  context 'validation tests' do
    it 'should save succesfully' do
      sala = Sala.new(nombre: 'Sala', user_id: '1234567').save
      expect(sala).to eq(true)
    end
  end

  # context 'relations test' do
  #   it 'should have many mensajes' do
  #     t = Sala.reflect_on_association(:mensajes)
  #     expect(t.macro).to eq(:has_many)
  #   end
  # end
end
