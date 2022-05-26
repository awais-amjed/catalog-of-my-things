require 'json'
require_relative '../classes/author'
require_relative '../modules/data_storage_handler'
class AuthorManager
  attr_reader :authors

  def initialize(all_items)
    @all_items = all_items
    @authors = []
    @file_name = 'authors'
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

  def list_authors
    @authors.each do |author|
      puts author.to_json
    end
  end

  def store_authors
    DataStorageHandler.save_data('author', @authors)
  end

  def read_author
    authors = DataStorageHandler.read_data(@file_name)
    @authors = authors.map do |writer|
      author = Author.new(writer['first_name'], writer['last_name'])
      write['items'].map do |item|
        find_item = @all_items.find { |i| i.id == item }
        author.add_item(find_item)
      end
      author
    end
  end
end
