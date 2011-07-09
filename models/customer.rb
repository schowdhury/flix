class Customer
  attr_accessor :username, :password, :movie_queue
  
  def initialize(username, password)
    @username = username
    @password = password
    @movie_queue= MovieLibrary.new
  end
  
  def add_to_queue(movie_name)
    movie = main_library.find(movie_name)
    if movie
      main_library.delete(movie)
      @movie_queue << movie
    end
  end
  
  def remove_from_queue(movie_name)
    movie = @movie_queue.find(movie_name)
    if movie
      @movie_queue.delete(movie)
      main_library << movie  
    end
  end
  
  def rent_movie(movie_name)
    movie = @movie_queue.find(movie_name)
    if movie && (!movie.rented?) && can_rent?
      movie.rent
    end
    movie  
  end
  
  def return_movie(movie_name)
    movie = @movie_queue.find(movie_name)
    if movie
      movie.return
      main_library << @movie_queue.delete(movie)
    end
  end
  
  def main_library
    MovieLibrary.main_instance
  end
  
  def can_rent?
    @movie_queue.select{|m|m.rented?}.size == 0 
  end     
end