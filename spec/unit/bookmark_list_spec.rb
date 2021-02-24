require 'Bookmark'


describe Bookmark do
  subject(:bookmark) { described_class.new("hello") }
  it {is_expected.to respond_to(:text)}
  let(:con) { PG.connect :dbname => 'bookmark_manager_test' }

  describe '#self.all' do
    it 'returns array of Bookmark instances' do
      con.exec "INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com')"
      con.exec "INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com')"
      con.exec "INSERT INTO bookmarks (url) VALUES('http://www.google.com')"
      expect(Bookmark.all).to include("http://www.makersacademy.com")
      expect(Bookmark.all).to include("http://www.destroyallsoftware.com")
      expect(Bookmark.all).to include("http://www.google.com")
    end
  end

end
