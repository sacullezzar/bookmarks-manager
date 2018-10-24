require './lib/bookmark.rb'

describe Bookmark do
  describe '.all' do
    it "returns all bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', '???');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google');")
      bookmarks = Bookmark.all
      expect(bookmarks[0]).to include("url"=>"http://www.makersacademy.com", "title"=>"Makers Academy")
      expect(bookmarks[1]).to include("url"=>"http://www.destroyallsoftware.com", "title"=>"???")
      expect(bookmarks[2]).to include("url"=>"http://www.google.com", "title"=>"Google")
    end
  end

  describe '.add' do
    it 'adds a bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.add('http://www.facebook.com', 'Facebook')
    bookmark = Bookmark.all
    expect(bookmark[0]).to include("url"=>"http://www.facebook.com")
    expect(bookmark[0]).to include("title"=>"Facebook")
  end
end
end
