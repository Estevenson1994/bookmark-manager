require_relative '../lib/bookmark.rb'

def db_setup
  @con = PG.connect :dbname => 'bookmark_manager_test'
  @con.exec "TRUNCATE bookmarks;"
  Bookmark.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')
  Bookmark.add(title: 'google', url: 'http://www.google.com')
end
