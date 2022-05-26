require 'json'
require_relative '../classes/author'
require_relative '../modules/data_storage_handler'
class AuthorManager
  attr_reader :authors

  def initialize(all_items)
    @all_items = all_items
    @authors = []
    @file_name = 'authors'

    read_author
  end

  def select_author
    puts 'Select an Author by number: '
    list_authors(show_index: true)
    puts "#{@authors.length + 1}) Add an Author"
    print "\nYour choice: "
    choice = gets.chomp.to_i
    if choice.zero? || choice > @authors.length + 1
      puts 'Invalid choice! Try again'
      select_author
    end
    return add_author if choice == @authors.length + 1

    @authors[choice - 1]
  end

  def add_author
    puts 'First name'
    first_name = gets.chomp
    puts 'Last name'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors.push(author) unless @authors.include?(author)
    author
  end

  def list_authors(show_index: false)
    index = 1
    @authors.each do |author|
      puts "#{"#{index}) " if show_index}#{author.to_json}"
      index += 1
    end
  end

  def store_authors
    DataStorageHandler.save_data(@file_name, @authors)
  end

  def read_author
    authors = DataStorageHandler.read_data(@file_name)
    @authors = authors.map do |writer|
      author = Author.new(writer['first_name'], writer['last_name'])
      writer['items'].map do |item|
        find_item = @all_items.find { |i| i.id == item }
        author.add_item(find_item) unless find_item.nil?
      end
      author
    end
  end
end
