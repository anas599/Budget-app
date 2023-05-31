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
    before(:each) do
      u1.save
    end
    before(:each) do
      visit '/'
    end

    it 'should have a name' do
      visit groups_path
      fill_in 'Email', with: 'rails@railsmail.com'
      fill_in 'Password', with: '111111'
      click_button('Log in')
      sleep 2
      expect(page).to have_content('Name')
    end
    it 'should have an icon' do
      visit groups_path
      expect(page).to have_content('Icon')
    end
  end
end
