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
  describe'.add' do
    before(:each) do
      db_setup
    end
    it 'adds a bookmark' do
      Bookmark.add("http://www.bbc.co.uk")
      expect(Bookmark.list).to include('http://www.bbc.co.uk')
    end
  end
end
