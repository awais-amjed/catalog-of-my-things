require_relative '../book'
require_relative '../date_handler'

describe Book do
  context 'Given a publisher, publish_date and cover state' do
    it 'should create a Music Album with the provided arguments' do
      publish_date = '2022-01-01'
      publisher = 'Test Publisher'
      cover_state = 'good'
      book = Book.new(publisher, publish_date, cover_state)

      expect(book.publish_date).to eql(DateHandler.from_string(publish_date))
      expect(book.publisher).to eql(publisher)
      expect(book.cover_state).to eql(cover_state)
      expect(book.archived).to_not be_truthy
      expect(book.id).to_not be_nil
    end
  end

  before :each do
    @book = Book.new('Test Publisher', '2022-01-01', 'good')
  end

  context 'Given a Music Album, Calling can_be_archived? function on it' do
    it 'should return true if Item can be archived or Cover State is bad' do
      expect(@book.can_be_archived?).to_not be_truthy

      @book.publish_date = DateHandler.from_string('2010-10-10')
      expect(@book.can_be_archived?).to be_truthy

      @book.cover_state = 'bad'
      expect(@book.can_be_archived?).to be_truthy
    end
  end
end
