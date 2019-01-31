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
    expect(page).to have_link('google', href: 'http://www.google.com')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('BBC', href: 'http://www.bbc.co.uk')
  end
  scenario 'delete bookmark' do
    visit('/')
    click_button('Bookmarks')
    expect(page).to have_link('google', href: 'http://www.google.com')
    click_button('Delete bookmarks')
    fill_in "delete_bookmark", :with => 'google'
    click_button 'delete'
    expect(page).to_not have_link('google', href: 'http://www.google.com')
  end
end
