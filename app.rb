require 'sinatra/base'
require './lib/bookmark'

class BMManager < Sinatra::Base
  get '/' do
    erb :index
  end
  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/add' do
    Bookmark.add(title: params[:title], url: params[:new_bookmark])
    redirect('/bookmarks')
  end

  get '/bookmarks/delete' do
    erb :'bookmarks/delete'
  end

  post '/delete' do
    Bookmark.delete(params[:delete_bookmark])
    redirect('/bookmarks')
  end

  run! if app_file == $0
end
