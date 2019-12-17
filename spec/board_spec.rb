require './lib/board.rb'

describe Board do
  describe "Board#has_four?" do
    it "returns who won if an array has four contiguous identical values" do
      b = Board.new
      expect(b.has_four?([1,1,1,1,2])).to eql(1)
    end
    
    it "returns nil if array doesn't have four contiguous identical values" do
      b = Board.new
      expect(b.has_four?([1,2,1,2,1])).to eql(nil)
    end

    it "returns nil for size 0 array" do
      b = Board.new
      expect(b.has_four?([])).to eql(nil)
    end

    it "works for size 3 arrays" do
      b = Board.new
      expect(b.has_four?([1,1,1])).to eql(nil)
    end

    it "returns nil if 4 nil's in a row" do
      b = Board.new
      expect(b.has_four?([nil,nil,nil,nil])).to eql(nil)
    end
  end

  describe "Board#is_full?" do
    it "returns true if a column is full" do
      b = Board.new
      expect(b.is_full?([1,1,2,2,1,1])).to eql(true)
    end

    it "returns false if a column has less than 6 non-zero elements" do
      b = Board.new
      expect(b.is_full?([1,1,0,0,0,0])).to eql(false)
    end

  end

  describe "Board#add_piece" do
    it "puts 4 1's in columns 2 and 3" do
      b = Board.new
      2.times do |i|
        4.times do 
          b.add_piece(1, i+2)
        end
      end
      b.show_board
    end
  end

  describe "Board#flattenFill" do
    it "has 4x 1's in col 0, 3x 1's in col 3, a 2 in col 5" do
      b = Board.new
      b.columns[0][0] = 1
      b.columns[0][1] = 1
      b.columns[0][2] = 1
      b.columns[0][3] = 1
      b.columns[3][0] = 1
      b.columns[3][1] = 1
      b.columns[3][2] = 1
      b.columns[5][0] = 2
      b.show_board
    end
  end

  describe "Board#check_win" do
    it "reports 1 for 4 1's in a column" do
      b = Board.new
      4.times {b.add_piece(1, 3)}
      b.show_board
      expect(b.check_win).to eql(1)
    end

    it "reports win for 4 2's in a row" do
      b = Board.new
      4.times {|i| b.add_piece(2, i)}
      b.show_board
      expect(b.check_win).to eql(2)
    end

    it "reports win for 4 1's in an up-right diagonal" do
      b = Board.new
      b.add_piece(1,0)
      b.add_piece(2,1)
      b.add_piece(2,2)
      b.add_piece(2,3)
      b.add_piece(1,1)
      b.add_piece(2,2)
      b.add_piece(2,3)
      b.add_piece(1,2)
      b.add_piece(1,3)
      b.add_piece(1,3)
      b.show_board
      expect(b.check_win).to eql(1)
    end

    it "reports win for 4 2's in a down-left diagonal" do
      b = Board.new
      b.add_piece(1,0)
      b.add_piece(1,1)
      b.add_piece(1,2)
      b.add_piece(2,3)
      b.add_piece(1,0)
      b.add_piece(1,1)
      b.add_piece(2,2)
      b.add_piece(1,0)
      b.add_piece(2,1)
      b.add_piece(2,0)
      b.show_board
      expect(b.check_win).to eql(2)
    end
  end
    
end
