require "gem"

string = "base16"
symbol = :base16
fixnum = 0
float  = 0.00
array  = Array.new
array  = ['chris', 85]
hash   = {"test" => "test"}
regexp = /[abc\(]/

# TODO This is a comment
module Earth
  class Person < Creature

    attr_accessor :name

    def initialize(attributes = {})
      @name = attributes[:name]
    end

    def self.greet
      "hello"
    end

    def foreach
      begin
        [].each do |item|
          puts item
        end
      end
    end

    def while
      $i = 0
      $num = 5

      while $i < $num  do
        puts("Inside the loop i = #$i" )
        $i += 1
      end
    end

    def interpolation
      test = "ab"
      out = "My name is #{ test }"
    end

    def compare_numbers
      1 < 2
      1 <= 2
      1 == 2
      1 >= 2
      1 > 2
      test = 2
    end

    def operators
      test = 1 + 2
      test = 1 - 2
      test = 1 / 2
      test = 1 * 2
      test = 1 % 2
      test -= 1
      test += 2
    end

    def switch_case
      test = 1
      case test
      when 0
        "zero"
      when 1
        "one"
      when 2
        "two"
      else
        "test"
      end
    end

    def debugger
      debugger
      binding.pry
      byebug
    end
  end
end

person1 = Earth::Person.new(:name => "Chris")
print Earth::Person::greet, " ", person1.name, "\n"
puts "another #{Person::greet} #{person1.name}"
