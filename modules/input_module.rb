module InputModule
  def self.get_genre_label_author(genre_manager, label_manager, author_manager)
    genre = genre_manager.select_genre
    label = label_manager.select_label
    author = author_manager.select_author
    [genre, label, author]
  end
end
