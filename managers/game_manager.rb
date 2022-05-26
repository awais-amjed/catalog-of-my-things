require_relative '../classes/game'
require_relative '../classes/author'
require 'json'
require_relative '../modules/data_storage_handler'
require_relative '../modules/input_module'

class GameManager
  attr_accessor :games

  def initialize
    @games = []
    @file_name = 'games'
  end

  def add_game(genre_manager, label_manager, author_manager)
    puts 'Multiplayer? (y/n)'
    multi_player = gets.chomp
    puts 'Last played at (yyyy-mm-dd)'
    last_played_at = gets.chomp
    puts 'Publish date (yyyy-mm-dd)'
    publish_date = gets.chomp
    game = Game.new(multi_player: multi_player, last_played_at: last_played_at, publish_date: publish_date)
    game.move_to_archive if game.can_be_archived?
    genre, label, author = InputModule.get_genre_label_author(genre_manager, label_manager, author_manager)
    genre.add_item(game)
    label.add_item(game)
    author.add_item(game)
    @games.push(game)
    puts 'Game added Successfully!'
  end

  def store_games
    DataStorageHandler.save_data('game', @games)
  end

  def list_games
    @games.each do |game|
      puts game.to_json
    end
  end

  def read_games
    games = DataStorageHandler.read_data(@file_name)
    @games = games.map do |game|
      Game.new(multi_player: game['multi_player'],
               last_played_at: game['last_played_at'],
               publish_date: game['publish_date'],
               id: game['id'],
               archived: game['archived'])
    end
  end
end
