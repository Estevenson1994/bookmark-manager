def db_setup
  @con = PG.connect :dbname => ENV['DB']
  @con.exec "TRUNCATE bookmarks;"
  @con.exec "INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');"
  @con.exec "INSERT INTO bookmarks (url) VALUES ('http://www.google.com');"
end
