require_relative '../genre'
require_relative '../music_album'

describe Genre do
  context 'Given a name' do
    it 'should create a Genre with the provided name' do
      name = 'Action'
      genre = Genre.new(name)

      expect(genre.name).to eql(name)
      expect(genre.id).to_not be_nil
    end
  end

  before :each do
    @genre = Genre.new('Action')
  end

  context 'Given a Genre, Calling add_item function with an item' do
    it 'should return add the item to items list and update the genre of item' do
      item = MusicAlbum.new('2022-01-01')
      @genre.add_item(item)

      expect(@genre.items).to_not be_empty
      expect(item.genre).to equal(@genre)
    end
  end
end
