feature 'Index page' do
  scenario 'view list of bookmarks' do
    visit('/')
    expect(page).to have_content('Bookmark Manager')
  end
end
