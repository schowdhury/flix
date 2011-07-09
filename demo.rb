Dir[File.join(Dir.pwd, "models/**/*.rb")].each {|f| require f }

main_library = MovieLibrary.create_main_instance
main_library << Movie.new("Dirty Harry", "Do you feel lucky", "1971", "Thriller")
main_library << Movie.new("Dirty Harry", "Do you feel lucky", "1971", "Thriller")
main_library << Movie.new("Taxi Driver","","1976","Thriller")
main_library << Movie.new("Blade Runner", "Do androids dream of electric sheep", "1982", "Sci Fi")
taxi_driver = main_library.find("Taxi Driver")
main_library.delete(taxi_driver) if taxi_driver

puts "*"*20
puts "Main library has: #{main_library.collect(&:title).join(', ')}"
#main library.  [dirty harry, dirty harry, blade runner]

customer = Customer.new("sameerchowdhury","password")

customer.add_to_queue("Dirty Harry")

puts "Customer adds Dirty Harry to queue.  Customer queue is: #{customer.movie_queue.collect(&:title).join(', ')}"

puts "Main library has: #{main_library.collect(&:title).join(', ')}"
 
customer.add_to_queue("Blade Runner")

puts "Customer adds Blade Runner to queue.  Customer queue is: #{customer.movie_queue.collect(&:title).join(', ')}"

puts "Main library has: #{main_library.collect(&:title).join(', ')}"

customer.rent_movie("Blade Runner")

customer.return_movie("Blade Runner")

puts "Customer rents and returns Blade Runner.  Customer queue is: #{customer.movie_queue.collect(&:title).join(', ')}"

puts "Main library has: #{main_library.collect(&:title).join(', ')}"
puts "*"*20