require_relative '../modules/date_handler'
require_relative '../classes/music_album'
require_relative '../modules/input_module'

class MusicAlbumManager
  attr_reader :music_albums

  def initialize
    @music_albums = []
    @file_name = 'music_album'

    load_music_albums
  end

  def add_music_album(genre_manager, label_manager, author_manager)
    print 'Enter the publish date of Music Album (yyyy-mm-dd): '
    publish_date = gets.chomp
    begin
      DateHandler.from_string(publish_date)
    rescue ArgumentError
      puts 'Invalid Date! Try again'
      add_music_album(genre_manager, label_manager, author_manager)
    end
    genre, label, author = InputModule.get_genre_label_author(genre_manager, label_manager, author_manager)
    print 'Is the Music Album available on Spotify? (Y/N): '
    on_spotify = gets.chomp
    add_music_album(genre_manager, label_manager, author_manager) unless %w[y n].include?(on_spotify.downcase)
    new_music_album = MusicAlbum.new(publish_date, on_spotify: on_spotify.downcase == 'y')
    genre.add_item(new_music_album)
    label.add_item(new_music_album)
    author.add_item(new_music_album)

    new_music_album.move_to_archive
    @music_albums << new_music_album
    puts 'Music Album added Successfully!'
  end

  def list_all_music_albums
    @music_albums.each(&:show)
  end

  def save_music_albums
    DataStorageHandler.save_data(@file_name, @music_albums)
  end

  def load_music_albums
    data = DataStorageHandler.read_data(@file_name)
    data.each do |album|
      @music_albums << MusicAlbum.new(album['publish_date'],
                                      album['id'],
                                      on_spotify: album['on_spotify'],
                                      archived: album['archived'])
    end
  end
end
