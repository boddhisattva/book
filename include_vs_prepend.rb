=begin
Module gains #prepend as a compliment to #include, it works just like include, but it inserts the module in to the inheritance chain as if it were a subclass rather than a superclass.
This way, you can call the same method defined in the class via a call to super

Object
superclass
included module
class
prepended module
=end

class Foo
  def do_stuff
    puts "doing stuff from Foo"
  end
end

class Foo1
  def do_stuff
    puts "doing stuff from Foo1"
  end
end

module Wrapper
  def do_stuff
    puts "before stuff from Wrapper"
    super
    puts "after stuff"
  end
end

module Wrapper1
  def do_stuff
    puts "before stuff"
    super
    puts "after stuff"
  end
end

module Wrapper2
  def do_stuff
    puts "before stuff from Wrapper2"
    super
    puts "after stuff from Wrapper2"
  end
end

# using include
class Foo
  include Wrapper
  include Wrapper2
end

# using prepend
class Foo1
  prepend Wrapper1
end

Foo.new.do_stuff
Foo1.new.do_stuff