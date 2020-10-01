require 'pry'
class Board
  attr_reader(:title, :id, :description)

  @@boards = {}
  @@total_rows = 0

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id) || @@total_rows += 1
    @description = attributes.fetch(:description)
  end  

  def self.all
    @@boards.values()
  end    
    
  def save
    @@boards[id] = Board.new({:title => self.title, :id => self.id, :description => self.description})  
  end

  def ==(board_to_compare)
    self.title() == board_to_compare.title()
  end  

  def self.find(id)
    @@boards[id]
  end  

  def self.clear
    @@boards = {}
    @@total_rows = 0  
  end

  def self.sort_board_by_name()
    @@boards.values.sort_by(&:title.downcase)
    # {|title| title.downcase}
    # binding.pry
  end

  def update(title, description)
    @title = title
    @description = description
  end

  def delete
    @@boards.delete(self.id)
  end

  def messages 
    Message.find_by_board(self.id)
  end
end  

