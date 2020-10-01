require('rspec')
require('board')
require('pry')

describe('#Board') do
  
  before(:each) do
    Board.clear()
  end

  describe('#initialize') do
    it('creates instance of Board') do
      board = Board.new({:title => "Thoughts", :id => nil})
      expect(board.title).to(eq("Thoughts"))
    end
  end

  describe('.all') do
    it('displays all Boards') do
      board = Board.new({:title => 'Thoughts', :id => nil})
      board.save()
      board2 = Board.new({:title => 'Robots', :id => nil})
      board2.save()
      expect(Board.all).to(eq([board, board2]))
    end
  end

  describe('#save') do
    it('saves board to mock database') do
      board = Board.new({:title => 'Thoughts', :id => nil})
      board.save()
      board2 = Board.new({:title => 'Robots', :id => nil})
      board2.save()
      expect(Board.all).to(eq([board, board2]))
    end
  end

  describe('#==') do
    it('Is the same board if it has the same name') do
      board = Board.new({:title => 'Thoughts', :id => nil})
      board.save()
      board2 = Board.new({:title => 'Thoughts', :id => nil})
      board2.save()
      expect(board).to(eq(board2))
    end
  end

  describe('.clear') do
    it('clears all baords') do
      board = Board.new({:title => 'Thoughts', :id => nil})
      board.save()
      bboard2 = Board.new({:title => 'Robots', :id => nil})
      board.save()
      Board.clear()
      expect(Board.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds specific board from its ID') do
      board = Board.new({:title => 'Thoughts', :id => nil})
      board.save()
      # board.find()
      expect(Board.find(board.id)).to(eq(board))
    end  
  end
end