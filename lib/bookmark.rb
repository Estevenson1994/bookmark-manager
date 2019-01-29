require 'pg'

class Bookmark
  def self.list
    connect_db
    rs = @con.exec "SELECT * FROM bookmarks;"
    rs.map do |row|
      row['url']
    end
  end

  def self.add(bookmark)
    connect_db
    @con.exec "INSERT INTO bookmarks (url) VALUES (\'#{bookmark}\');" 
  end

  private

  def self.connect_db
    ENV['DB'] = 'bookmark_manager' if ENV['DB'] == nil
    @con = PG.connect :dbname => ENV['DB']
  end
end
