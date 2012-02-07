This is a code sample demo app I built for a job interview.  It's simply a movie rental system with a movie library.  

In the project root:
Run demo with: ruby demo.rb
Run specs with: rspec spec

How would you do 2 rentals:
Change happens only in one place: customer.can_rent? method.

Instead of checking any movie is rented before renting it:
	customer.movie_queue.select{|m|m.rented?}.size == 0 
You change the implementation to: 
	customer.movie_queue.inject(0) {|sum, movie| movie.rented? ? sum+=1 : sum} <= 2
You cannot rent if you already have 2 rented out