require './lib/bookmark.rb'

describe Bookmark do
  describe '.all' do
    it "returns all bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end

  describe '.add' do
    it 'adds a bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.add('http://www.facebook.com')
    bookmark = Bookmark.all
    expect(bookmark).to include("http://www.facebook.com")
  end
end
end
