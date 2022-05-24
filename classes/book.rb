require_relative 'item.rb'
class Book < Item
  attr_accessor :publisher, :cover_state

  def initialise(publisher, publish_date, cover_state)
    super(publish_state)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end