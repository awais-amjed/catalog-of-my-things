require_relative '../classes/music_album'
require_relative '../modules/date_handler'

describe MusicAlbum do
  context 'Given a publish_date' do
    it 'should create a Music Album with the provided Publish Date' do
      publish_date = '2022-01-01'
      music_album = MusicAlbum.new(publish_date)

      expect(music_album.publish_date).to eql(DateHandler.from_string(publish_date))
      expect(music_album.on_spotify).to_not be_truthy
      expect(music_album.archived).to_not be_truthy
      expect(music_album.id).to_not be_nil
    end
  end

  before :each do
    @music_album = MusicAlbum.new('2022-01-01')
  end

  context 'Given a Music Album, Calling can_be_archived? function on it' do
    it 'should return true if Item can be archived and Music Album is on Spotify' do
      expect(@music_album.can_be_archived?).to_not be_truthy

      @music_album.publish_date = DateHandler.from_string('2010-10-10')
      expect(@music_album.can_be_archived?).to_not be_truthy

      @music_album.on_spotify = true
      expect(@music_album.can_be_archived?).to be_truthy
    end
  end
end
