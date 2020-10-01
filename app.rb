require('sinatra')
require('sinatra/reloader')
require('./lib/board')
require('pry')
require('./lib/message')
also_reload('lib/**/*.rb')

get('/') do
  @boards = Board.all
  erb(:boards)
end

get('/boards') do
  @boards = Board.all.sort #REMEMBER
  erb(:boards)
end

post('/boards') do
  title = params[:title_name]
  board = Board.new(:title => title, :id => nil)
  board.save()
  @boards = Board.all()
  erb(:boards)
  #redirect to('/boards')
end

get('/boards/new') do
  erb(:new_board)
end