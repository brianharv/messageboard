require('sinatra')
require('sinatra/reloader')
require('./lib/board')
require('pry')
require('./lib/message')
also_reload('lib/**/*.rb')

get('/') do
  @boards = Board.all()
  erb(:boards)
end

get('/boards') do
  @boards = Board.all
  erb(:boards)
end

post('/boards') do
  title = params[:title_name]
  description = params[:board_description]
  board = Board.new(:title => title, :id => nil, :description => description)
  board.save()
  @boards = Board.all
  erb(:boards)
end

get('/boards/new') do
  erb(:new_board)
end

get('/boards/:id') do #this route will take us to board. We are passing ID into URL
  @board = Board.find(params[:id].to_i)
  # message = Message.new(:title => nil, :id => nil, :body => nil)
  # message.save()
  # @messages = Message.all
  erb(:board)
end

get('/boards/:id/edit') do
  @board = Board.find(params[:id].to_i)
  erb(:edit_board)
end

patch('/boards/:id') do
  @board = Board.find(params[:id].to_i)
  @board.update(params[:title_rename], params[:new_description])
  erb(:board)
end

## Messages

post('/boards/:id/message') do
  @board = Board.find(params[:id].to_i)
  message = Message.new({:title => params[:message_title], :message_id => nil, :body => params[:message_body], :board_id => @board.id})
  message.save()
  # @messages = Message.all()
  erb(:board)
end
