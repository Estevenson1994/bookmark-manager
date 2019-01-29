feature 'Viewing bookmarks' do
    before(:each) do
      db_setup
    end
  scenario 'can see a list of bookmarks' do
    visit('/')
    click_button('Bookmarks')
    expect(page).to have_content 'List of Bookmarks'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.makersacademy.com'
  end
  scenario 'adding bookmarks' do
    visit('/')
    click_button('Bookmarks')
    fill_in "new_bookmark", :with => 'http://www.bbc.co.uk'
    click_button 'Add'
    expect(page).to have_content 'List of Bookmarks'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.bbc.co.uk'
  end
end
