class GenreManager
  attr_reader :genres

  def initialize
    @genres = []
  end

  def add_genre
    print 'Enter the Name of Genre: '
    name = gets.chomp
    @genres << Genre.new(name)
    puts 'Genre added successfully!'
  end

  def list_all_genres
    @genres.each(&:show)
  end
end
