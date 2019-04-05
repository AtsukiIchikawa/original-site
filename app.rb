require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

get '/' do
    @title = "Site Top"
    erb :index
end

get '/about' do
    @title = "How To Use"
    erb :about
end

post '/new_page' do
    @title = params['title']
    @content = params['content'].gsub(/(\r\n|\r|\n)/, "<br>")
    p @title
    p @content
end

get '/new_page' do
    erb :new_content
end

get '/pages' do
    erb :pages
end
