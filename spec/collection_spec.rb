require 'spec_helper'

shared_examples "a collection" do
  let(:collection) { described_class.new([7, 2, 4]) }

  context "initialized with 3 items" do
    it "says it has three items" do
      collection.size.should eq(3)
    end
  end

  context "access element" do
    it "first element is 7" do
      collection[0].should eq(7)
    end
  end
 
  context "assign element" do
    it "assigns 5 to first element" do
      collection[0] = 5
      collection[0].should eq(5)
    end
  end 
  
  context "append element" do
    it "appends 5 to the collection" do
      collection<< 5
      collection[3].should eq(5)
      collection.size.should == 4
    end
  end
  
  describe "#include?" do
    context "with an an item that is in the collection" do
      it "returns true" do
        collection.include?(7).should be_true
      end
    end

    context "with an an item that is not in the collection" do
      it "returns false" do
        collection.include?(9).should be_false
      end
    end
  end
end