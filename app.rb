require 'sinatra/base'
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/add' do
    erb :'bookmarks/add'
  end

  post '/temp' do
    Bookmark.add(params[:URL], params[:Title])
    redirect '/add'
  end

  run! if app_file == $0
end
