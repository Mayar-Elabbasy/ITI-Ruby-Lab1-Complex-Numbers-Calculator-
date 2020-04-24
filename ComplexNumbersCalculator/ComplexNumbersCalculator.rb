class ComplexNumber
    attr_reader :real, :imaginary
    @@add_count = 0
    @@multiply_count = 0
  
    def initialize(real, imaginary)
      @real = real.to_f.round(10)
      @imaginary = imaginary.to_f.round(10)
    end
  
    def ==(other)
      real == other.real && imaginary == other.imaginary
    end
  
    def +(other)
      @@add_count += 1
      ComplexNumber.new(@real + other.real, @imaginary + other.imaginary)
    end
  
    def *(other)
      @@multiply_count += 1
      new_real = @real * other.real - @imaginary * other.imaginary
      new_imaginary = @imaginary * other.real + @real * other.imaginary
      ComplexNumber.new(new_real, new_imaginary)
    end
  
    def to_s
        return "#{@real} + #{@imaginary}i"
    end

    def self.bulk_add(array)
        arraySum = ComplexNumber.new(0,0)
        array.each{ |other|
        arraySum = arraySum + other
        @@add_count += 1
        }
        arraySum
    end

    def self.bulk_multiply​(array)
        arrayMultiply = array.first
        array.drop(1).each {|other|
        arrayMultiply = arrayMultiply * other 
        @@multiply_count += 1
        }
        arrayMultiply 
    end
      
    def self.get_stats()
        puts "Counts of Add calculations: #{@@add_count}"
        puts "Counts of Multiply calculations: #{@@multiply_count}"
    end 

  end
  

complex1 = ComplexNumber.new(3,2)
complex2 = ComplexNumber.new(1,7)
complex3 = ComplexNumber.new(4,5)
arraySum = ComplexNumber.bulk_add([complex1,complex2,complex3])
arrayMultiply = ComplexNumber.bulk_multiply​([complex1,complex2,complex3])

complexSum = complex1 + complex2
complexMultiply = complex1 * complex2
puts complexSum
puts complexMultiply
puts arraySum
puts arrayMultiply
puts ComplexNumber.get_stats()
