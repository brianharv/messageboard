require 'rspec'
require 'message'
require 'board'
require 'pry'

describe '#message' do

  before(:each) do
    Board.clear()
    Message.clear()
    @board = Board.new({:title => "Thoughts", :id => nil, :description => nil})
    @board.save()
  end

  describe('#==') do
    it("is the same song if it has the same attributes as another song") do
      message = Message.new({:title => "Chubby Checker", :message_id => nil, :body => nil, :board_id => @board.id})
      message2 = Message.new({:title => "Chubby Checker", :message_id => nil, :body => nil, :board_id => @board.id})
      expect(message).to(eq(message2))
    end
  end

  describe('.all') do
    it("returns a list of all messages") do
      message = Message.new({:title => "Elvis", :message_id => nil, :body => nil, :board_id => @board.id})
      message.save()
      message2 = Message.new({:title => "Chubby Checker", :message_id => nil, :body => nil, :board_id => @board.id})
      message2.save()
      expect(Message.all).to(eq([message, message2]))
    end
  end

  describe('.clear') do
    it("clears all messages") do
      message = Message.new({:title => "Elvis", :message_id => nil, :body => nil, :board_id => @board.id})
      message.save()
      message2 = Message.new({:title => "Chubby Checker", :message_id => nil, :body => nil, :board_id => @board.id})
      message2.save()
      Message.clear()
      expect(Message.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a message") do
      message = Message.new({:title => "Chubby Checker", :message_id => nil, :body => nil, :board_id => @board.id})
      message.save()
      expect(Message.all).to(eq([message]))
    end
  end

  describe('.find') do
    it("finds a message by id") do
      message = Message.new({:title => "Elvis", :message_id => nil, :body => nil, :board_id => @board.id})
      message.save()
      message2 = Message.new({:title => "Chubby Checker", :message_id => nil, :body => nil, :board_id => @board.id})
      message2.save()
      expect(Message.find(message.message_id)).to(eq(message))
    end
  end

  describe('#update') do
    it("updates an message by id") do
      message = Message.new({:title => "Chubby Checker", :message_id => nil, :body => nil, :board_id => @board.id})
      message.save()
      message.update("Mr. P.C.", :body => nil)
      expect(message.title).to(eq("Mr. P.C."))
    end
  end

  describe('#delete') do
    it("deletes an message by id") do
      message = Message.new({:title => "Elvis", :message_id => nil, :body => nil, :board_id => @board.id})
      message.save()
      message2 = Message.new({:title => "Chubby Checker", :message_id => nil, :body => nil, :board_id => @board.id})
      message2.save()
      message.delete()
      expect(Message.all).to(eq([message2]))
    end
  end

  describe('.find_by_board') do
    it("finds messages for a board") do
      board2 = Board.new({:title => "Elvis Facts", :id => nil, :description => nil, })
      board2.save
      message = Message.new({:title => "Elvis", :message_id => nil, :body => nil, :board_id => @board.id})
      message.save()
      message2 = Message.new({:title => "Elvis", :message_id => nil, :body => nil, :board_id => board2.id})
      message2.save()
      expect(Message.find_by_board(board2.id)).to(eq([message2]))
    end
  end

  describe('#board') do
    it("finds the board an message belongs to") do
      message = Message.new({:title => "Naima", :message_id => nil, :body => nil, :board_id => @board.id})
      message.save()
      expect(message.board()).to(eq(@board))
    end
  end

end