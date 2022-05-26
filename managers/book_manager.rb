require_relative '../classes/book'
require_relative '../modules/date_handler'
require_relative '../modules/input_module'

class BookManager
  attr_reader :books

  def initialize
    @books = []
    @file_name = 'book'
  end

  def add_book(genre_manager, label_manager, author_manager)
    print 'Enter the publish date of the book (yyyy-mm-dd): '
    publish_date = gets.chomp
    begin
      DateHandler.from_string(publish_date)
    rescue ArgumentError
      puts 'Invalid Date! Try again'
      add_book(genre_manager, label_manager, author_manager)
    end
    print 'Who is the Publisher of this book: '
    publisher = gets.chomp
    print 'How is the state of book cover: '
    cover_state = gets.chomp
    genre, label, author = InputModule.get_genre_label_author(genre_manager, label_manager, author_manager)
    new_book = Book.new(publisher, publish_date, cover_state)
    label.add_item(new_book)
    genre.add_item(new_book)
    author.add_item(new_book)
    new_book.move_to_archive
    @books << new_book
    puts 'Book added Successfully!'
  end

  def list_all_books
    @books.each(&:show)
  end

  def save_books
    DataStorageHandler.save_data(@file_name, @books)
  end

  def load_books
    data = DataStorageHandler.read_data(@file_name)
    data.each do |book|
      @books << Book.new(book['publisher'],
                         book['publish_date'],
                         book['cover_state'],
                         id: book['id'],
                         archived: book['archived'])
    end
  end
end
