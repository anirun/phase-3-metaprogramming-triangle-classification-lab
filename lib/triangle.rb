require 'pry'

class Triangle
  attr_reader :equilateral, :isosceles, :scalene
  attr_accessor :a, :b, :c
  
  def initialize (a,b,c)
    self.a = a
    self.b = b
    self.c = c
  end
  
  def kind
    if a == 0 || b == 0 || c == 0
      raise TriangleError
    elsif (a * b * c).negative?() == true
      raise TriangleError
    elsif (a+b) <= c || (a+c) <= b || (b+c) <= a
      raise TriangleError
    elsif a == b && b == c
      :equilateral
    elsif a == b && c != b || a == c && b != c || b == c && a != c
      :isosceles
    elsif (a+b) > c || (a+c) > b || (b+c) > a
      :scalene
    end
  end

  class TriangleError < StandardError
  end

end
