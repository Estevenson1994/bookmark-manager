feature 'Index page' do
  scenario 'view list of bookmarks' do
    visit('/')
    expect(page).to have_content('List of Bookmarks')
  end
end
