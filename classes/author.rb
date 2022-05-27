class Author
  attr_reader :id, :items
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @items = []
    @id = id || Random.rand(1...1000)
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.author = self
  end

  def to_json(*_args)
    {
      id: @id,
      first_name: first_name,
      last_name: last_name,
      items: @items.map(&:id)
    }.to_json
  end
end
