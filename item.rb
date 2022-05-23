class Item
  attr_accessor :id, :publish_date, :archived
  attr_reader :genre, :source, :author, :label

  def initialize(id, publish_date, archived: false)
    @id = id
    @publish_date = publish_date
    @archived = archived

    @genre = []
    @source = []
    @author = []
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
