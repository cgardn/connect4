class Board

  attr_accessor :columns

  def initialize
    @columns = [ 
      [0,0,0,0,0,0],
      [0,0,0,0,0,0],
      [0,0,0,0,0,0],
      [0,0,0,0,0,0],
      [0,0,0,0,0,0],
      [0,0,0,0,0,0],
      [0,0,0,0,0,0] ]

  end

  def has_four?(arr = [])
    count = 1
    last = nil
    arr.each_with_index do |i, ind|
      if i == last and [1,2].include? i
        count += 1
        if count >= 4
          return i
        end
      else
        count = 1
      end
      last = i
    end
    nil
  end

  def is_full?(arr = [])
    arr.include?(0) ? false : true
  end

  def check_win
    # check columns
    out = nil
    @columns.each do |col|
      out = has_four?(col)
      if out != nil
        return out
      end
    end

    # check rows
    col_t = @columns.transpose
    col_t.each do |col|
      out = has_four?(col)
      if out != nil
        return out
      end
    end

    # check diagonals
    col_f = @columns.flatten
    # down-left
    col_f.each_index do |ind|
      arr = []
      6.times do |i|
        arr.push(col_f[ind+(i*5)])
      end
      out = has_four?(arr)
      if out != nil
        return out
      end
    end

    # up-right
    col_f.each_index do |ind|
      arr = []
      6.times do |i|
        arr.push(col_f[ind+(i*7)])
      end
      out = has_four?(arr)
      if out != nil
        return out
      end
    end

    out
  end

  def flattenFill(arr)
    # this will be moved to Display class later, only used
    #   to fill out @columns for display
    #   - also, might not be needed, maybe just indexing 
    #     to an empty space will return nil in show_board?
    new_arr = []
    7.times do |i|
      6.times do |k|
        if arr[i][k] != 0 
          new_arr.push(arr[i][k])
        else
          new_arr.push(0)
        end
      end
    end
    new_arr
  end

  def show_board
    # this will be moved to Display class later
    puts "CONNECT 4!!!"
    puts "\n" + "-"*10 + "\n"
    arr = flattenFill(@columns)
    6.times do |i|
      7.times do |k|
        c = arr[(5-i) + (6*k)]
        c == 0 ? c = '.' : c = c
        print "#{c} "
      end
      print "\n"
    end
    print "-"*10 + "\n"
    7.times do |i|
      print "#{i+1} "
    end
  end

  def add_piece(num, column)
    if !is_full?(@columns[column])
      ind = @columns[column].index(0)
      @columns[column][ind] = num 
    else
      0
    end
    1
  end

end
