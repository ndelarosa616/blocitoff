require 'rails_helper'

feature 'Project manager creates TODO' do

  before do
    @user = create(:user)
    @item = create(:item)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'
  end


  scenario 'Successfully' do
    user = @user
    visit user_path(user)
    fill_in 'item_name', with: @item.name
    click_button 'Add'

    expect(page).to have_content(@item.name)
  end  

  scenario 'Unsucessfully' do
    fill_in 'item_name', with: ''
    click_button 'Add'

    expect(page).to have_content('Error saving ToDo - please try again.')
  end
end