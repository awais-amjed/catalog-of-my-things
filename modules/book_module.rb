module BookModule
  def capture_input(request_text)
    puts "#{request_text}"
    gets.chomp
  end

  def add_new_book_details
    puts "\nEnter new book details\n\n"
    publisher = capture_input('Enter publisher name: ')
    publish_date = capture_input('Enter publish date: ')
    cover_state = capture_input('Enter cover state e.g good or bad: ')

    @app.add_book([publisher, publish_date, cover_state])
    puts "\nNew book added!"
    add_new_label_details
  end

  def add_new_label_details
    puts "\nENTER LABEL DETAILS"

    title = capture_input('Enter the label title: ')
    color = capture_input('Enter the label color: ')
    @app.add_label([title, color])
    puts '\nNew label added!'
  end
end