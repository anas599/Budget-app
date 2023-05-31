require 'rails_helper'

RSpec.describe Group, type: :system do
  describe 'Group index' do
    let(:u1) do
      User.create(id: 50,
                  name: 'rails',
                  created_at: '2023-05-22 16:34:29.347120000 +0000',
                  updated_at: '2023-05-22 16:34:29.347120000 +0000',
                  email: 'rails@railsmail.com',
                  password: '111111',
                  password_confirmation: '111111')
    end
    let(:g1) do
      Group.create(id: 1, name: 'Group 1', icon: 'flight ', user_id: u1.id)
    end
    before(:each) do
      u1.save
      g1.save
    end
    before(:each) do
      visit '/'
    end

    it 'should have a name' do
      visit groups_path
      fill_in 'Email', with: 'rails@railsmail.com'
      fill_in 'Password', with: '111111'
      click_button('Log in')
      sleep 1
      expect(page).to have_content('Group 1')
    end
    it 'should have an icon' do
      visit groups_path
      fill_in 'Email', with: 'rails@railsmail.com'
      fill_in 'Password', with: '111111'
      click_button('Log in')
      sleep 1
      expect(page).to have_content('flight')
    end
    it 'should have a button for add category' do
      visit groups_path
      fill_in 'Email', with: 'rails@railsmail.com'
      fill_in 'Password', with: '111111'
      click_button('Log in')
      sleep 1
      expect(page).to have_content('Add category')
    end
    it 'should have a text of 0$' do
      visit groups_path
      fill_in 'Email', with: 'rails@railsmail.com'
      fill_in 'Password', with: '111111'
      click_button('Log in')
      sleep 1
      expect(page).to have_content('0$')
    end
  end
  describe 'Group show' do
    let(:u1) do
      User.create(id: 1,
                  name: 'rails',
                  created_at: '2023-05-22 16:34:29.347120000 +0000',
                  updated_at: '2023-05-22 16:34:29.347120000 +0000',
                  email: 'rails@railsmail.com',
                  password: '111111',
                  password_confirmation: '111111')
    end
    let(:g1) do
      Group.create(id: 1, name: 'Group 1', icon: 'flight ', user_id: u1.id)
    end
    let(:e1) do
      Entity.create(id: 1, name: 'Entity 1', amount: 1000, user_id: u1.id, group_id: g1.id)
    end
    before(:each) do
      u1.save
      g1.save
      e1.save
    end
    before(:each) do
      visit '/'
    end
    it 'should have a name' do
      visit group_path(g1.id)
      fill_in 'Email', with: 'rails@railsmail.com'
      fill_in 'Password', with: '111111'
      click_button('Log in')
      sleep 1
      expect(page).to have_content('Group 1')
    end
    it 'should have amount of 1000 and entity name' do
      visit group_path(g1.id)
      fill_in 'Email', with: 'rails@railsmail.com'
      fill_in 'Password', with: '111111'
      click_button('Log in')
      sleep 1
      click_link('Group 1')
      sleep 1
      expect(page).to have_content('1000')
      expect(page).to have_content('Entity 1')
    end
  end
end
