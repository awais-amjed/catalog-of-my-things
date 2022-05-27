require_relative '../modules/date_handler'
class Item
  attr_accessor :publish_date
  attr_reader :id, :archived, :genre, :author, :label

  def initialize(publish_date:, id: nil, archived: false)
    @id = id || Random.rand(1...1000)
    @publish_date = DateHandler.from_string(publish_date)
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def label=(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end

  def author=(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
