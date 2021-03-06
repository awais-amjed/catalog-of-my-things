require 'fileutils'
require 'json'
require_relative '../classes/music_album'
require_relative '../classes/genre'

module DataStorageHandler
  def self.save_data(file_name, data)
    FileUtils.mkdir_p './data' unless File.directory?('./data')
    File.write("data/#{file_name}.json", JSON.pretty_generate(data), mode: 'w')
  end

  def self.read_data(file_name)
    return JSON.parse(File.read("data/#{file_name}.json")) if File.exist?("data/#{file_name}.json")

    []
  end
end
