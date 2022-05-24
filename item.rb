class Item
  attr_accessor :publish_date
  attr_reader :id, :genre, :source, :author, :label, :archived

  def initialize(publish_date, id = nil, archived: false)
    @id = id || rand(1...1000)
    @publish_date = publish_date
    @archived = archived

    @source = []
    @author = []
    @label = []
  end

  def genre=(genre)
    @genre = genre
    @genre.add_item(self)
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
