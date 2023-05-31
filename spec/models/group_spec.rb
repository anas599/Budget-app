require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Group index' do
    it 'should have a name' do
      group = Group.new
      group.name = 'Group 1'
      expect(group.name).to eq('Group 1')
    end
    it 'should have an icon' do
      group = Group.new
      group.icon = 'Icon 1'
      expect(group.icon).to eq('Icon 1')
    end
  end
  describe 'Group show' do
    it 'should have a name' do
      group = Group.new
      group.name = 'Group 1'
      expect(group.name).to eq('Group 1')
    end
  end
end
