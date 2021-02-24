require 'pg'

class Bookmark
  attr_reader :text

  def self.all
    if ENV['ENVIRONMENT'] == 'test' 
      con = PG.connect :dbname => 'bookmark_manager_test'
    else 
      con = PG.connect :dbname => 'bookmark_manager'
    end
    rs = con.exec "SELECT * FROM bookmarks"
    rs.map { |row| row['url'] }
  end

  def initialize(text)
    @text = text
  end

end
