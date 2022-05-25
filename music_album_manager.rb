require_relative 'date_handler'
require_relative 'music_album'

class MusicAlbumManager
  attr_reader :music_albums

  def initialize
    @music_albums = []
    @file_name = 'music_album'
  end

  def add_music_album(genre_manager)
    print 'Enter the publish date of Music Album (yyyy-mm-dd): '
    publish_date = gets.chomp
    begin
      publish_date = DateHandler.from_string(publish_date)
    rescue ArgumentError
      puts 'Invalid Date! Try again'
      add_music_album(genre_manager)
    end
    genre = genre_manager.select_genre
    # TODO: Add selection of other properties (label, source and author)
    print 'Is the Music Album available on Spotify? (Y/N): '
    on_spotify = gets.chomp
    add_music_album(genre_manager) unless %w[y n].include?(on_spotify.downcase)
    new_music_album = MusicAlbum.new(publish_date, on_spotify: on_spotify.downcase == 'y')
    genre.add_item(new_music_album)

    # TODO: Add the other properties here
    new_music_album.move_to_archive?
    @music_albums << new_music_album
  end

  def list_all_music_albums
    @music_albums.each(&:show)
  end
end
