class Movie
  attr_accessor :title, :description, :year_filmed, :genre
  
  def initialize(title, description, year_filmed, genre)
    @title = title
    @description = description
    @year_filmed = year_filmed
    @genre = genre
    @rented = false
  end
  
  def rent
    @rented = true
  end
    
  def return
    @rented = false
  end
    
  def rented?
    @rented
  end
    
end