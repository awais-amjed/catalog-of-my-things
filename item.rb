require_relative './date_handler'
class Item
  attr_accessor :publish_date, :genre
  attr_reader :id, :source, :label, :archived, :author

  def initialize(publish_date:, id: nil, archived: false)
    @id = id || Random.rand(1...1000)
    @publish_date = DateHandler.from_string(publish_date)
    @archived = archived
    @source = []
    @label = []
  end

  def add_genre(genre)
    @genre << genre
  end

  def add_source(source)
    @source << source
  end

  def add_author(author)
    @author << author
  end

  def add_label(label)
    @label << label
  end

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end

  def move_to_archive?
    @archived = true if can_be_archived?
  end
end
