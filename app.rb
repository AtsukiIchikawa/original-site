require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: './db/pagecontents.db'
)

class Content < ActiveRecord::Base
    validates :pagetitle, presence: true
    validates :body, presence: true
end


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

get '/contents/:content_id' do |id|
    @new_content = Content.all[id.to_i - 1].body
    erb :newcontent
end

get '/test/1' do
    p Content.all[1].body
end


#post '/new_page' do
#    @title = params['title']
#    @content = params['content'].gsub(/(\r\n|\r|\n)/, "<br>")
#    p @title
#    p @content
#end
