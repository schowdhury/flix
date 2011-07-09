require 'forwardable'

class MovieLibrary  
  extend Forwardable
  include Enumerable   
  
  attr_accessor :movies
  def_delegators :@movies, :size, :<<, :[], :[]=, :delete
  
  @@main_instance = nil
  
  def initialize(movies=[])
    @movies = movies
  end
  
  def self.create_main_instance
    @@main_instance ||= MovieLibrary.new
  end

  def find(movie_name)
    @movies.select{|m| m.title == movie_name }.first
  end
  
  def each
    @movies.each do |movie| 
      yield movie
    end
  end
  
  protected
  
  def self.main_instance
    @@main_instance
  end
end