class Author
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @items = []
    @id = Random.rand(1..1_000_000)
  end

  def add_item(item)
    item.author = self
    @items.push(item) unless @items.include?(item)
  end

  def to_json(*_args)
    {
      id: @id,
      name: "#{@first_name} #{@last_name}",
      items: @items
    }.to_json
  end
end
