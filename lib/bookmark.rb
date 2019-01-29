require 'pg'

class Bookmark
  def self.list
    con = PG.connect :dbname => ENV['DB']
    rs = con.exec "SELECT * FROM bookmarks"
    rs.map do |row|
      row['url']
    end
  end
end
