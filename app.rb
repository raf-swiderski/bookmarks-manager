require 'sinatra/base'
require './lib/bookmark.rb'
require 'pg'

class BookmarkManager < Sinatra::Base
  # enable :sessions
  # set :session_secret, ENV['SESSION_SECRET']

  before do
    @bookmarks = Bookmark.all
  end

  get '/' do
      erb :index
  end

  get '/bookmarks' do
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
