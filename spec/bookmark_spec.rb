require 'bookmark'

RSpec.describe Bookmark do
  describe '.list' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.list
      expect(bookmarks).to include('http://www.google.com')
      expect(bookmarks).to include('http://www.youtube.com')
      expect(bookmarks).to include('http://www.makersacademy.com')
    end
  end
end
