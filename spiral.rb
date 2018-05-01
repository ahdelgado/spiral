class Spiral

  def initialize(n)
    @size = n
    @counter = 1
    @distance = n-1
    @currentRow = 0
    @currentColumn = 0
    @move = ['right','down','left','up']
    @table = Array.new(n) { Array.new(n) }
  end

  def spiral
    while (@counter <= @size**2)
      direction = @move.first
      case direction
        when 'right'
          goRight
        when 'down'
          goDown
        when 'left'
          goLeft
        when 'up'
          goUp
      end
      @move.rotate!
    end
    displayResult
  end

  private

  def goRight
    (0..@distance).each do
      traverse
      @currentColumn += 1
    end
    @distance -= 1
    @currentRow += 1
    @currentColumn -= 1
  end

  def goDown
    (0..@distance).each do
      traverse
      @currentRow += 1
    end
    @currentColumn -= 1
    @currentRow -= 1
  end

  def goLeft
    (0..@distance).each do
      traverse
      @currentColumn -= 1
    end
    @currentColumn += 1
    @currentRow -= 1
    @distance -= 1
  end

  def goUp
    (0..@distance).each do
      traverse
      @currentRow -= 1
    end
    @currentColumn += 1
    @currentRow += 1
  end

  def traverse
    @table[@currentRow][@currentColumn] = @counter
    @counter += 1
  end

  def displayResult
    @table.each do |t|
      p t
    end
  end

  def displayCurrentPosition
    p ['@currentRow=', @currentRow]
    p ['@currentColumn', @currentColumn]
  end
end

Spiral.new(10).spiral