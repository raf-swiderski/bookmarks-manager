require 'Bookmark'
require 'db_helpers'

describe Bookmark do
  # subject(:bookmark) { described_class.new("hello") }
  # it {is_expected.to respond_to(:text)}
  # let(:con) { PG.connect :dbname => 'bookmark_manager_test' }

  describe '#self.all' do
    it 'returns array of Bookmark instances' do
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end
  describe '#self.create' do 
    it 'creates a new bookmark' do 
      bookmark = Bookmark.create(url: 'http://www.test.com', title: 'Test')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test'
      expect(bookmark.url).to eq 'http://www.test.com'
    end
  end
end
