class Author
  attr_reader :id, :items
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @items = []
    @id = id || Random.rand
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
  end

  def to_json(*_args)
    i = @items.map(&:id)
    {
      id: @id,
      name: "#{@first_name} #{@last_name}",
      items: i
    }.to_json
  end
end
