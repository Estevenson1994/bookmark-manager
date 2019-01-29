require 'pg'

class Bookmark

  attr_reader :id, :title, :url
  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    connect_db
    rs = @con.exec "SELECT * FROM bookmarks;"
    @list = []
    rs.each do |row|
      @list << Bookmark.new(row['id'], row['title'], row['url'])
    end
    @list
  end

  def self.add(title, bookmark)
    connect_db
    @con.exec "INSERT INTO bookmarks (url, title) VALUES (\'#{bookmark}\', \'#{title}\');" 
  end

  private

  def self.connect_db
    ENV['DB'] = 'bookmark_manager' if ENV['DB'] == nil
    @con = PG.connect :dbname => ENV['DB']
  end
end
