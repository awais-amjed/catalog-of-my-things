require_relative './item'
class Label
  attr_accessor :title, :color
  attr_reader :items, :id

  def initialise(id, title, color, items)
    id = Random.rand(1..100)
    @title = title
    @color = color
    @items = []


  def add_item(new_item)
    @items << new_item
    new_item.label == self
  end
end
