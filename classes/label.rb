require_relative './item'
class Label
  attr_accessor :title, :color
  attr_reader :items

  def initialise(id, title, color, items)
    @id = id || rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_label(label)
    @label = label
    label.items << self
  end

end
