require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, id = nil, on_spotify: false, archived: false)
    super(publish_date, id, archived: archived)

    @on_spotify = on_spotify
  end
end
