require 'application_system_test_case'

class GroupsTest < ApplicationSystemTestCase
  setup do
    @group = groups(:one)
  end

  test 'visiting the index' do
    visit groups_url
    assert_selector 'h1', text: 'Groups'
  end

  test 'should create group' do
    visit groups_url
    click_on 'Add category'

    fill_in 'Entity', with: @group.entity_id
    fill_in 'Icon', with: @group.icon
    fill_in 'User', with: @group.user_id
    click_on 'Create Group'

    assert_text 'Group was successfully created'
    click_on 'Back'
  end

  test 'should update Group' do
    visit group_url(@group)
    click_on 'Edit this group', match: :first

    fill_in 'Entity', with: @group.entity_id
    fill_in 'Icon', with: @group.icon
    fill_in 'User', with: @group.user_id
    click_on 'Update Group'

    assert_text 'Group was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Group' do
    visit group_url(@group)
    click_on 'Remove category', match: :first

    assert_text 'Group was successfully destroyed'
  end
end
