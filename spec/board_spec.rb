require './lib/board.rb'

describe Board do
  describe "Board#has_four?" do
    it "returns true if an array has four contiguous identical values" do
      b = Board.new
      expect(b.has_four?([1,1,1,1,2])).to eql(true)
    end
    
    it "returns false if an array does not have four contiguous identical values" do
      b = Board.new
      expect(b.has_four?([1,2,1,2,1])).to eql(false)
    end

    it "returns false for size 0 array" do
      b = Board.new
      expect(b.has_four?([])).to eql(false)
    end

    it "works for size 3 arrays" do
      b = Board.new
      expect(b.has_four?([1,1,1])).to eql(false)
    end

    it "should only work for 1s and 2s" do
      b = Board.new
      expect(b.has_four?([0,0,0,0]).to eql(false)
    end
  end

  describe "Board#is_full?" do
    it "returns true if a column is full" do
      b = Board.new
      expect(b.is_full?([1,1,2,2,1,1])).to eql(true)
    end

    it "returns false if a column has less than 6 elements" do
      b = Board.new
      expect(b.is_full?([1,1])).to eql(false)
    end

    it "returns false for size 0 array" do
      b = Board.new
      expect(b.is_full?([])).to eql(false)
    end
  end
end
