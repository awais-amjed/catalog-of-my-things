require_relative './item'
class Label
  attr_accessor :title, :color, :label
  attr_reader :items, :id

  def initialise(title, color, items, id = nil)
    @id = id || rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_label(self)
  end
end
