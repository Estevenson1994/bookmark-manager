feature 'Viewing bookmarks' do
  scenario 'can see a list of bookmarks' do
    visit('/')
    click_button('Bookmarks')
    expect(page).to have_content 'List of Bookmarks'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.youtube.com'
    expect(page).to have_content 'http://www.makersacademy.com'
  end
end
