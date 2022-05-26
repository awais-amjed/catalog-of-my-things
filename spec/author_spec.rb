require_relative '../author'
require_relative '../game'

describe Author do
  it 'should initialize with an instance of author' do
    author = Author.new('Dagic', 'Zewdu')
    expect(author).to be_a(Author)
  end
  it 'should have first name based on input' do
    author = Author.new('Dagic', 'Zewdu')
    expect(author.first_name).to eq('Dagic')
  end
  it 'should have last name based on input' do
    author = Author.new('Dagic', 'Zewdu')
    expect(author.last_name).to eq('Zewdu')
  end
  it 'should add item to items array' do
    author = Author.new('Dagic', 'Zewdu')
    game = Game.new(multi_player: true, last_played_at: '2018-01-01', publish_date: '2018-01-01', archived: false)
    author.add_item(game)
    expect(author.items).to include(game)
  end
end
