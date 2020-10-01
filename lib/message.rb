require 'pry'
class Message
  attr_reader(:title, :id, :body)

  @@messages = {}
  @@total_rows = 0

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id) || @@total_rows += 1
    @body = attributes.fetch(:body)
  end  

  def self.all
    @@messages.values()
  end    
    
  def save
    @@messages[id] = Message.new({:title => self.title, :id => self.id, :body => self.body})  
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
    @@messages.delete(self.id)
  end

  def self.find_by_board(id)
    messages = []
    @@messages.values.each do |message|
      if message.id == id
        messages.push(message)
      end
    end
    messages
  end

  def board
    Board.find(self.id)
  end
end  