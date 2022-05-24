require 'json'
require_relative '../classes/book'
require_relative '../classes/label'

module HandleBooks
  def include_label(book)
    puts 'Let\'s add a title and color for this book'
    puts 'Title: '
    title = gets.chomp
    puts 'Color: '
    color = gets.chomp
    label = Label.new(title, color)
    book.add_label(label)
  end

  def include_cover
    valid = false
    cover_state = ''
    until valid
      print 'What is the state of the book cover[good/bad]: '
      cover_state = gets.chomp
      valid = %w[good bad].include?(cover_state)
      cover_state = '' unless valid
      puts 'Please insert good or bad as the cover state' unless valid
    end
    cover_state
  end

  def include_date
    valid = false
    publish_date = ''
    until valid
      puts 'What date was the book published: '
      publish_date = gets.chomp
      valid = begin
        Date.parse(publish_date)
        true
      rescue ArgumentError
        false
      end
      publish_date = '' unless valid
      puts 'Kindly insert a valid date using this format YYYY/MM/DD' unless valid
    end
    publish_date
  end

  def create_book
    puts 'What is the publisher\'s name: '
    publisher = gets.chomp
    cover_state = include_cover
    publish_date = include_date
    [publisher, cover_state, publish_date]
  end

  def add_to_json(book)
    File.write('books.json', '[]') unless File.exist? 'books.json'
    books = JSON.parse(File.read('books.json'))
    books << { 'id' => book.id, 'publisher' => book.publisher, 'cover_state' => book.cover_state,
               'publish_date' => book.publish_date,
               'label' => { 'title' => book.label.title, 'color' => book.label.color } }
    File.write('books.json', JSON.generate(books))
  end

  def add_book
    publisher, cover_state, publish_date = create_book
    book = Book.new(publisher, cover_state, publish_date)
    include_label(book)
    add_to_json(book)
    puts 'Book created successfully'
  end
end
