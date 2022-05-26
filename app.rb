require_relative 'managers/genre_manager'
require_relative 'managers/book_manager'
require_relative 'managers/author_manager'
require_relative 'managers/game_manager'
require_relative 'managers/label_manager'
require_relative 'managers/music_album_manager'

class App
  def initialize
    @genre_manager = GenreManager.new
    @book_manager = BookManager.new
    @author_manager = AuthorManager.new
    @game_manager = GameManager.new
    @label_manager = LabelManager.new
    @music_album_manager = MusicAlbumManager.new
  end

  def handle_choice(choice)
    case choice
    when '1'
      @book_manager.list_all_books
    when '2'
      @music_album_manager.list_all_music_albums
    when '3'
      @game_manager.list_games
    when '4'
      @genre_manager.list_all_genres
    when '5'
      @label_manager.list_all_labels
    when '6'
      @author_manager.list_authors
    when '7'
      @book_manager.add_book(@label_manager)
    when '8'
      @music_album_manager.add_music_album(@genre_manager)
    when '9'
      @game_manager.add_game(@author_manager)
    else
      puts '<-- Wrong Choice! Try again -->'
    end
  end

  def run
    puts 'Welcome to Catalog of my Things'
    loop do
      puts "\n1 - List all Books
          2 - List all Music Albums
          3 - List all Games
          4 - List all Genres
          5 - List all Labels
          6 - List all Authors
          7 - Add a book
          8 - Add a Music Album
          9 - Add a Game
          10 - Exit"
      print 'Your Choice: '
      choice = gets.chomp
      break if choice == '10'

      handle_choice(choice)
    end
  end
end