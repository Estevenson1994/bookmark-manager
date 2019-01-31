feature 'Viewing bookmarks' do
  scenario 'can see a list of bookmarks' do
    visit('/')
    click_button('Bookmarks')
    expect(page).to have_content 'List of Bookmarks'
    expect(page).to have_content 'google'
    expect(page).to have_content 'Makers Academy'
  end
  scenario 'adding bookmarks' do
    visit('/')
    click_button('Bookmarks')
    click_button('Add new bookmark')
    fill_in "new_bookmark", :with => 'http://www.bbc.co.uk'
    fill_in "title", :with => 'BBC'
    click_button 'Add'
    expect(page).to have_content 'List of Bookmarks'
    expect(page).to have_content 'google'
    expect(page).to have_content 'Makers Academy'
    expect(page).to have_content 'BBC'
  end
  scenario 'delete bookmark' do
    visit('/')
    click_button('Bookmarks')
    click_button('Delete bookmarks')
    fill_in "delete_bookmark", :with => 'google'
    click_button 'delete'
    expect(page).to_not have_content 'google'
  end
end
