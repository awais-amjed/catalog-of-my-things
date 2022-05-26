require_relative 'item'

class Game < Item
  attr_accessor :multi_player, :last_played_at

  def initialize(multi_player:, last_played_at:, publish_date:, id: nil, archived: false)
    @multi_player = multi_player
    @last_played_at = last_played_at
    @publish_date = publish_date
    super(publish_date: publish_date, id: id, archived: archived)
  end

  def can_be_archived
    current_date = Date.today
    super && (@last_played_at.slice(0, 3).to_i - current_date.year) > 2
  end

  def to_json(*_args)
    {
      id: @id,
      multi_player: @multi_player,
      last_played_at: @last_played_at,
      publish_date: @publish_date,
      archived: @archived
    }.to_json
  end
end
