require_relative '../item'
class Label
  attr_accessor :title, :color, :label
  attr_reader :items, :id

  def initialize(title, color, id: nil)
    @id = id || rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
