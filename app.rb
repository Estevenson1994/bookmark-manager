require 'sinatra/base'
require './lib/bookmark'

class BMManager < Sinatra::Base
  get '/' do
    erb :index
  end
  get '/bookmarks' do
    @bookmarks = Bookmark.list
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end
