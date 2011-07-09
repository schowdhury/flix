require 'spec_helper'

describe "Movie" do
  let(:valid_movie) {Movie.new("Blade Runner", "Do androids dream of electric sheep", "1982", "Sci Fi") }   
  describe "initialize" do
    it "should respond to :title, :description, :year_filmed, :genre" do
      [:title, :description, :year_filmed, :genre].each do |attr|
        valid_movie.should respond_to(attr)
        valid_movie.should respond_to("#{attr}=")
      end
    end
  end
  
  describe "rent" do
    it "should set rented to true" do
      valid_movie.rented?.should be_false
      valid_movie.rent
      valid_movie.rented?.should be_true
    end
  end
  
  describe "return" do
    it "should set rented to false" do
      valid_movie.rent
      valid_movie.rented?.should be_true
      valid_movie.return
      valid_movie.rented?.should be_false      
    end
  end
  
  describe "rented?" do
    it "should return true if the movie is rented out" do
      rented_state = valid_movie.instance_variable_get(:@rented)
      rented_state.should == valid_movie.rented?
    end
  end
end
