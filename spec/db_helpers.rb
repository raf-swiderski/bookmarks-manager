require 'pg'

def empty_test_db
    con = PG.connect :dbname => 'bookmark_manager_test'
    con.exec "TRUNCATE TABLE bookmarks"
end

def persisted_data(id:)
    connection = PG.connect :dbname => 'bookmark_manager_test'
    result = connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
    result.first
end