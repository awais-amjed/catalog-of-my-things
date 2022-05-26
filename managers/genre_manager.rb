require_relative '../modules/data_storage_handler'
require_relative '../classes/genre'

class GenreManager
  attr_reader :genres

  def initialize
    @genres = []
    @file_name = 'genres'
  end

  def select_genre
    print 'Select a Genre by number: '
    list_all_genres(show_index: true)
    puts "#{@genres.length + 1}) Add a genre"
    print "\nYour choice: "
    choice = gets.chomp.to_i
    if choice.zero? || choice > @genres.length + 1
      puts 'Invalid choice! Try again'
      select_genre
    end
    return add_genre if choice == @genres.length + 1

    @genres[choice]
  end

  def add_genre
    print 'Enter the Name of Genre: '
    name = gets.chomp
    new_genre = Genre.new(name)
    @genres << new_genre
    puts 'Genre added successfully!'
    new_genre
  end

  def list_all_genres(show_index: false)
    index = 1
    @genres.each do |genre|
      puts "#{"#{index}) " if show_index}#{genre.name}"
      index += 1
    end
  end

  def save_genres
    DataStorageHandler.save_data(@file_name, @genres)
  end

  def load_genres(all_items)
    data = DataStorageHandler.read_data(@file_name)
    data.each do |genre|
      new_genre = Genre.new(genre['name'], id: genre['id'])
      genre['items'].each do |id|
        found = all_items.detect { |item| item.id == id }
        new_genre.add_item(found)
      end
      @genres << new_genre
    end
  end
end
