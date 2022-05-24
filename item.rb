class Item
  attr_accessor :publish_date, :author
  attr_reader :id, :genre, :source, :label, :archived

  def initialize(id:, publish_date:, archived: false)
    @id = id || Random.rand(1..1_000_000)
    @publish_date = publish_date
    @archived = archived
    @genre = []
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
