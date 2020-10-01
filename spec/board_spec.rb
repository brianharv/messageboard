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
      board2 = Board.new({:title => 'Robots', :id => nil})
      board2.save()
      Board.clear()
      expect(Board.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds specific board from its ID') do
      board = Board.new({:title => 'Thoughts', :id => nil})
      board.save()
      expect(Board.find(board.id)).to(eq(board))
    end  
  end

  describe('.sort_board_by_name') do
    it('sorts boards alphabetically') do
      board = Board.new({:title => 'Thoughts', :id => nil})
      board.save()
      board2 = Board.new({:title => 'Robots', :id => nil})
      board2.save()
      board3 = Board.new({:title => 'Warm Cots', :id => nil})
      board3.save()
      expect(Board.sort_board_by_name).to(eq([board2, board, board3]))
    end
  end
end