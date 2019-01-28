require 'sinatra/base'

class BMManager < Sinatra::Base
  get '/' do
    erb :index
  end
  get '/bookmarks' do
    'List of Bookmarks'
  end

  run! if app_file == $0
end
