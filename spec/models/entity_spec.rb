require 'rails_helper'

RSpec.describe Entity, type: :model do
  describe 'Entity index' do
    it 'should have a name' do
      user = User.new(name: 'User 1', email: 'test@mail.com')
      entity = Entity.new(name: 'Entity 1', user_id: user.id, amount: 1000)
      expect(entity.name).to eq('Entity 1')
    end
    it 'should have amount' do
      user = User.new(name: 'User 1', email: 'test@mail.com')
      entity = Entity.new(name: 'Entity 1', user_id: user.id, amount: 1000)
      expect(entity.name).to eq('Entity 1')

      expect(entity.amount).to eq(1000)
    end
  end
  describe 'Entity show' do
    it 'should have a name' do
      user = User.new(name: 'User 1', email: 'test@mail.com')
      entity = Entity.new(name: 'Entity 1', user_id: user.id, amount: 1000)
      expect(entity.name).to eq('Entity 1')
    end
  end
  it 'should have amount' do
    user = User.new(name: 'User 1', email: 'test@mail.com')
    entity = Entity.new(name: 'Entity 1', user_id: user.id, amount: 1000)
    expect(entity.name).to eq('Entity 1')
    expect(entity.amount).to eq(1000)
  end
end
