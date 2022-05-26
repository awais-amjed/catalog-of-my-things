require_relative '../classes/book'
require_relative '../classes/label'

describe Label do
  context 'Given a title and a color' do
    it 'should create a Label with the provided arguments' do
      title = 'Test Label'
      color = 'Green'
      label = Label.new(title, color)

      expect(label.title).to eql(title)
      expect(label.color).to eql(color)
      expect(label.id).to_not be_nil
    end
  end

  before :each do
    @label = Label.new('Test Label', 'Green')
  end

  context 'Given a Label, Calling add_item function with an item' do
    it 'should add the item to items list and update the label of item' do
      item = Book.new('Test Publisher', '2022-01-01', 'good')
      @label.add_item(item)

      expect(@label.items).to_not be_empty
      expect(item.label).to equal(@label)
    end
  end
end
