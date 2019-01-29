require 'bookmark'

RSpec.describe Bookmark do
  describe '.all' do
    before(:each) do
      db_setup
    end
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks[1].url).to eq('http://www.google.com')
      expect(bookmarks[0].url).to eq('http://www.makersacademy.com')
    end
  end
  describe'.add' do
    before(:each) do
      db_setup
    end
    it 'adds a bookmark' do
      Bookmark.add('bbc',"http://www.bbc.co.uk")
      expect(Bookmark.all[-1].url).to eq('http://www.bbc.co.uk')
    end
  end
end
