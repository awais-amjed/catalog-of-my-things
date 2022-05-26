require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, publish_date, cover_state, id: nil, archived: false)
    super(publish_date: publish_date, id: id, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def show
    puts "\n<--- Book ##{id} --->"
    puts "Published on #{DateHandler.to_string(@publish_date)}"
    puts "Published by #{@publisher}"
    puts "Author: #{@author.first_name} #{@author.last_name}" unless @author.nil?
    puts "Label: #{@label.title} | #{@label.color}" unless @label.nil?
    puts "Genre: #{@genre.name}" unless @genre.nil?
    puts "Source: #{@source.name}" unless @source.nil?
    puts "Cover State: #{@cover_state}"
  end

  def to_json(*_args)
    {
      id: @id,
      publisher: @publisher,
      publish_date: @publish_date,
      archived: @archived,
      cover_state: @cover_state
    }.to_json
  end
end