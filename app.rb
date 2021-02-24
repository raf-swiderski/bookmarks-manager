require 'sinatra/base'
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET']

  before do
    @bookmark_list = Bookmark.all
  end

  get '/' do
      erb :index
  end

  get '/bookmarks' do
    @bookmark_list << session[:url]
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    session[:url] = params[:url]
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
