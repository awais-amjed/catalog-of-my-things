require_relative './item'
require_relative './date_handler'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, id = nil, on_spotify: false, archived: false)
    super(publish_date: publish_date, id: id, archived: archived)

    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def show
    puts "\n<--- Music Album ##{id} --->"
    puts "Published on #{DateHandler.to_string(@publish_date)}"
    puts "Author: #{@author.first_name} #{@author.last_name}" unless @author.nil?
    puts "Label: #{@label.title} | #{@label.color}" unless @label.nil?
    puts "Genre: #{@genre.name}" unless @genre.nil?
    puts "Source: #{@source.name}" unless @source.nil?
    puts "#{'Not ' unless @on_spotify}Available on Spotify"
  end

  def to_json(*_args)
    {
      id: @id,
      publish_date: @publish_date,
      archived: @archived,
      on_spotify: @on_spotify
    }.to_json
  end
end
