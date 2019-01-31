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

  def self.add(title:, url:)
    connect_db
    @con.exec "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}');" 
  end

  def self.delete(title)
    connect_db
    @con.exec "DELETE FROM bookmarks WHERE title = '#{title}';"
  end


  private

  def self.connect_db
    if ENV['ENVIRONMENT'] == 'test'
      @con = PG.connect :dbname => 'bookmark_manager_test'
    else
      @con = PG.connect :dbname => 'bookmark_manager'
    end
  end
end
