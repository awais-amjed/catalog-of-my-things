class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name, id: nil)
    @id = id || Random.rand(1...1000)
    @name = name

    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.genre = self
  end

  def show
    puts @name
  end

  def to_json(*_args)
    {
      id: @id,
      name: @name,
      items: @items.map do |item|
        {
          id: item.id,
          class_name: item.class
        }
      end
    }.to_json
  end
end
