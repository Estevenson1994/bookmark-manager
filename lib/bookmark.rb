require 'pg'

class Bookmark

  attr_reader :id, :title, :url
  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    connect_db
    rs = @con.exec "SELECT * FROM bookmarks;"
    rs.map do |row|
      Bookmark.new(id: row['id'], title:  row['title'], url: row['url'])
    end
  end

  def self.add(title:, url:)
    connect_db
    result = @con.exec "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, title, url;" 
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url']) 
  end

  def self.delete(id:)
    connect_db
    @con.exec "DELETE FROM bookmarks WHERE id = '#{id}';"
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
