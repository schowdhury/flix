require 'spec_helper'

describe MovieLibrary do
  it_behaves_like "a collection"

  before(:each) do
    MovieLibrary.class_variable_set(:@@main_instance, nil)
    MovieLibrary.create_main_instance
  end
  
  let(:library) {MovieLibrary.new}
  let(:valid_movie) {Movie.new("Blade Runner", "Do androids dream of electric sheep", "1982", "Sci Fi") }
  let(:movie_two) {Movie.new("Dirty Harry", "Do you feel lucky", "1971", "Thriller") }
  
  describe "create_main_instance" do
    it "should set the main instance" do
      MovieLibrary.main_instance.size.should == 0
      MovieLibrary.main_instance << valid_movie
      MovieLibrary.main_instance.size.should == 1
    end
    
    it "should allow main_instance to be shared between movie library instances" do
      user1 = Customer.new("test","pass")
      user2 = Customer.new("test2","pass")
      user1.main_library.should == MovieLibrary.main_instance
      user2.main_library.should == MovieLibrary.main_instance    
    end
  end
    
  describe "add movie" do
    it "should allow you to add a movie to the library" do
      library.size.should == 0
      library << valid_movie
      library.size.should == 1
    end
  end

  describe "remove movie" do
    it "should allow you to remove a movie from the library" do
      library.size.should == 0
      library << valid_movie
      library.size.should == 1
      library.delete(valid_movie)
      library.size.should == 0              
    end
  end
  
  describe "find" do
    it "should return a movie if it is found in the customer queue" do
      library.size.should == 0
      library << valid_movie
      library.find(valid_movie.title).should == valid_movie
    end
  end
end