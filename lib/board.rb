class Board

  attr_accessor :columns

  def initialize
    @columns = [ [],[],[],[],[],[],[] ]

  end

  def has_four?(arr = [])
    count = 1
    last = nil
    arr.each_with_index do |i, ind|
      if i == last
        count += 1
        if count >= 4
          return true
        end
      else
        count = 1
      end
      last = i
    end
    false
  end

  def is_full?(arr = [])
    arr.size >= 6 ? true : false
  end

  def check_columns
  end
    

  def check_win
  end

  def show_board
    puts "CONNECT 4!!!"
    puts "\n" + "-"*10 + "\n"
    arr = @columns.flatten
    6.times do |i|
      7.times do |k|
        c = arr[(5-i) + (6*k)]
        c == nil ? c = '.' : c = c
        print "#{c} "
      end
      print "\n"
    end
  end

  def add_piece(char, column)
    @columns[column].push(char)
  end


end
