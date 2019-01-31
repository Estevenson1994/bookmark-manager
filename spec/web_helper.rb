def db_setup
  @con = PG.connect :dbname => 'bookmark_manager_test'
  @con.exec "TRUNCATE bookmarks;"
  @con.exec "INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy'); "
  @con.exec "INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'google');"
end
