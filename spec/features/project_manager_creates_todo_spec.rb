require 'rails_helper'

feature 'Project manager creates TODO' do

  before do
    @user = create(:user)
    @item = create(:item)
  end

  scenario 'Successfully' do
    user = @user
    visit user_items_path(user)
    fill_in 'item', with: @item.name
  end  
end