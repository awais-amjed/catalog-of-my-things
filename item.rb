require_relative './date_handler'
class Item
  attr_accessor :publish_date, :genre, :author, :source, :label
  attr_reader :id, :archived

  def initialize(publish_date:, id: nil, archived: false)
    @id = id || Random.rand(1...1000)
    @publish_date = DateHandler.from_string(publish_date)
    @archived = archived
    @source = []
    @label = []
  end

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end

  def move_to_archive?
    @archived = true if can_be_archived?
  end
end
