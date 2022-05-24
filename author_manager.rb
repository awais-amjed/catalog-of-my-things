require 'json'
require_relative 'author'
class AuthorManager
  attr_accessor :authors

  def initialize
    @authors = []
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
    File.write('data/author.json', JSON.pretty_generate(@authors), mode: 'w')
  end

  def read_author
    JSON.parse(File.read('data/author.json')) if File.exist?('data/author.json')
  end
end
