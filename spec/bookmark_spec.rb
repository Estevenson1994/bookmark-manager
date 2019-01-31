require 'bookmark'
require 'database_helpers'

RSpec.describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 2
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end
  describe'.add' do
    it 'adds a bookmark' do
      bookmark = Bookmark.add(title: 'bbc', url: "http://www.bbc.co.uk")
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'bbc'
      expect(bookmark.url).to eq 'http://www.bbc.co.uk'
    end
  end
end
