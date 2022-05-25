require_relative './item'
require_relative './date_handler'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, id = nil, on_spotify: false, archived: false)
    super(publish_date, id, archived: archived)

    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def display
    puts "\n<--- Music Album ##{id} --->
        Published on #{DateHandler.to_string(@publish_date)}
        Author: #{@author.first_name} #{@author.last_name}
        Label: #{@label.title} | #{@label.color}
        Genre: #{@genre.name}
        Source: #{@source.name}
        #{'Not ' unless @on_spotify}Available on Spotify"
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
