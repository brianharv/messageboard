require 'pry'
class Message
  attr_reader(:title, :message_id, :body)
  attr_accessor :board_id

  @@messages = {}
  @@total_rows = 0

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @message_id = attributes.fetch(:message_id) || @@total_rows += 1
    @body = attributes.fetch(:body)
    @board_id = attributes.fetch(:board_id)
  end  

  def self.all
    @@messages.values()
  end    
    
  def save
    @@messages[self.message_id] = Message.new({:title => self.title, :message_id => self.message_id, :body => self.body, :board_id => self.board_id})  
  end

  def ==(message_to_compare)
    self.title() == message_to_compare.title()
  end  

  def self.find(id)
    @@messages[id]
  end  

  def self.clear
    @@messages = {}
    @@total_rows = 0  
  end

  def self.sort_message_by_name()
    @@messages.values.sort_by(&:title.downcase)
  end

  def update(title, body)
    @title = title
    @body = body
  end

  def delete
    @@messages.delete(self.message_id)
  end

  def self.find_by_board(brd_id)
    messages = []
    @@messages.values.each do |message|
      if message.board_id == brd_id
        messages.push(message)
      end
    end
    messages
  end

  def board
    Board.find(self.board_id)
  end
end  