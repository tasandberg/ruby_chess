class Piece
  attr_reader :pos, :color, :board
  attr_writer :pos
  

  class NotImplementedError < StandardError; end
  
  def initialize(pos, color, board)
    @pos   = pos
    @color = color
    @board = board
  end
  
  def moves
    raise NotImplementedError.new("Moves method not implemented")
  end
  
  def update_pos
    @pos = @board.find(self)
  end
  
  
  def on_board?(pos)
    row, col = pos
    row.between?(0,7) && col.between?(0,7)
  end
  
  def valid_move?(pos)
    on_board?(pos) && (is_enemy?(pos) || @board[pos].nil?)# && !move_into_check(pos)
  end
  
  def is_enemy?(pos)
    !@board[pos].nil? && @board[pos].color != @color
  end
  
  def move_into_check(pos)
    dup_board = @board.dup
    dup_board.in_check?(@color)
  end
  
end