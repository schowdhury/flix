require 'spec_helper'

describe "Customer" do
  before(:each) do
    MovieLibrary.class_variable_set(:@@main_instance, nil)
    @main_library = MovieLibrary.create_main_instance  
    @customer = Customer.new("test","pass")  
  end
  
  let(:valid_movie) {Movie.new("Blade Runner", "Do androids dream of electric sheep", "1982", "Sci Fi") }  
  describe "add_to_queue(movie_name)" do
    it "should allow user to add movie to their queue" do
      @main_library << valid_movie
      @customer.add_to_queue(valid_movie.title)
      @customer.movie_queue.find(valid_movie.title).should == valid_movie
      @main_library.size.should == 0
    end
  end
  
  describe "remove_from_queue(movie_name)" do
    it "should allow user to remove movie from their queue" do
      @main_library << valid_movie
      @customer.add_to_queue(valid_movie.title)  
      @customer.movie_queue.find(valid_movie.title).should == valid_movie
      @main_library.size.should == 0
      @customer.remove_from_queue(valid_movie.title)  
      @main_library.size.should == 1 
      @customer.movie_queue.size.should == 0    
    end
  end
  
  describe "rent_movie(movie_name)" do
    it "should allow user to rent a movie that's in their queue" do
      @main_library << valid_movie
      @customer.add_to_queue(valid_movie.title)
      rented_movie = @customer.rent_movie(valid_movie.title)
      rented_movie.should be_rented
    end  
  end
  
  describe "return_movie(movie_name)" do
    it "should allow user to return a movie that they have rented" do   
      @main_library << valid_movie
      @customer.add_to_queue(valid_movie.title)
      rented_movie = @customer.rent_movie(valid_movie.title)
      @customer.return_movie(rented_movie.title)    
      @customer.movie_queue.size.should == 0
    end
  end
  
  describe "main_library" do
    it "should return the single instance of main library" do
      customer2 = Customer.new("test2","pass2")
      @customer.main_library.should == customer2.main_library
    end
    
  end
  
  describe "can_rent?" do
    it "should return true if the customer does not have any rentals" do 
      @main_library << valid_movie
      @customer.add_to_queue(valid_movie.title)
      @customer.rent_movie(valid_movie.title) 
      @customer.can_rent?.should == false    
    end
  end
end