require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: './db/myapp.db'
)

require_relative 'models/content'

get '/' do
    @title = "Site Top"
    erb :index
end

get '/contents' do
    @page_content = Content.all
    erb :contents
end

post '/create' do
    Content.create(pagetitle: params[:pagetitle], body: params[:body])
    redirect to('/contents')
end

get '/about' do
    @title = "How To Use"
    erb :about
end

get '/contents/:content_title' do |t|
    content = Content.find_by_pagetitle(t)
    @new_content = content.body.gsub(/(\r\n|\r|\n)/, "<br>")
    p @new_content
    erb :newcontent
end

get '/contents/:content_title/delete' do |t|
    Content.find_by_pagetitle(t).destroy
    p "title：#{t} が削除されました"
    erb :deleted
end
