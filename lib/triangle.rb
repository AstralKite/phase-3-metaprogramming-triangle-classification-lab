class Triangle
  # write code here

  attr_accessor :equilateral, :isosceles, :scalene

  @sides = []

  def initialize(s1, s2, s3)
    #valid numbers check
    raise_error = false
    @sides = [s1, s2, s3]

    #check for side value less than 0
    @sides.each do |side|
      if side <= 0 || side = nil
        raise_error = true
      end
    end

    #check for sum of two lengths
    if s3 + s2 <= s1
      raise_error = true
    end

    if s1 + s2 <= s3
      raise_error = true
    end

    if s1 + s3 <= s2
      raise_error = true
    end

    if raise_error
      raise TriangleError
    end

  end

  def kind
    if @sides.uniq.size <= 1
      :equilateral
    elsif @sides.uniq.size == 2
      :isosceles
    else
      :scalene
    end

  end

  class TriangleError < StandardError
  end

end
