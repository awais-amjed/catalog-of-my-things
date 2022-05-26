require 'date'

module DateHandler
  def self.from_string(date)
    # Receives date in 'yyyy-mm-dd' format and return a date object
    Date.parse(date)
  end

  def self.to_string(date)
    # Receives a Date Object and returns string in 'yyyy-mm-dd' format
    date.strftime('%Y-%m-%d')
  end
end
