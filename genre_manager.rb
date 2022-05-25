require_relative 'data_storage_handler'

class GenreManager
  attr_reader :genres

  def initialize
    @genres = []
    @file_name = 'genres'
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

  def save_genres
    DataStorageHandler.save_data(@file_name, @genres)
  end

  def load_genres(all_items)
    data = DataStorageHandler.read_data(@file_name)
    data.each do |genre|
      new_genre = Genre.new(genre['name'], id: genre['id'])
      genre['items'].each do |item|
        found = all_items.detect { |o| o.id == item['id'] }
        new_genre.add_item(found)
      end
      @genres << new_genre
    end
  end
end
