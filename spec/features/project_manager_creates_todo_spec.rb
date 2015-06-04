require 'rails_helper'

feature 'Project manager creates TODO' do

  before do
    @user = create(:user)
    @item = create(:item)
  end

  scenario 'Successfully' do
    user = authenticated_user
    visit user_items_path(user)
  end  
end