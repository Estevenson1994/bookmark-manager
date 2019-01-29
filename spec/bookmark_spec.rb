require 'bookmark'

RSpec.describe Bookmark do
  describe '.list' do
    before(:each) do
      db_setup
    end
    it 'returns all bookmarks' do
      bookmarks = Bookmark.list
      expect(bookmarks).to include('http://www.google.com')
      expect(bookmarks).to include('http://www.makersacademy.com')
    end
  end
end
