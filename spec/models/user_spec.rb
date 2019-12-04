require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures nombre presence' do
      user = User.new(email: 'josema.jmlo@gmail.com').save
      expect(user).to eq(false)
    end

    it 'ensures email presence' do
      user = User.new(nombre: 'Josema').save
      expect(user).to eq(false)
    end

    it 'ensures nombre presence' do
      user = User.new(email: 'josema.jmlo@gmail.com').save
      expect(user).to eq(false)
    end

    it 'should save succesfully' do
      user = User.new(nombre: 'Josema', email: 'josema.jmlo@gmail.com', password_digest: '123').save
      expect(user).to eq(true)
    end
  end
end
