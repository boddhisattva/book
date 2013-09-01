class Parent

 def get_weight

   "74"

 end

 protected

 def get_age

   "38"

 end

 def get_gender

   "female"

 end

 private

 def name

   'Mommy'

 end

end

class Child < Parent

 def get_parent_name

   # Implicit receiver

   puts name

   # Explicit receiver

   puts self.name rescue puts 'NoMethodError'  # see how we are calling one method from within another method using self

   # Explicit receiver

   puts Parent.new.name rescue puts 'NoMethodError'

   puts self.get_age rescue puts 'Cannot access protected method from self'

   puts Parent.new.get_age rescue puts 'Cannot access protected method'

 end

 def get_gender

   "male"

 end

end

Child.new.get_parent_name

# => Mommy

# => NoMethodError

# => NoMethodError

puts Child.new.get_gender # Overriding a method - one of the OOP concepts  - sub class method is given the priority

#Surprisingly the below three methods don't get called at all even though they are protected methods

#May be I need to call them after instantiating an object wrt the class

#Child.new.get_age Calling protected methods in ruby is possible - public_and_protected.rb:42:in `<main>': protected method `get_age' called for #<Child:0x8dbe6f8> (NoMethodError)

#Parent.new.get_age #public_and_protected.rb:43:in `<main>': protected method `get_age' called for #<Parent:0x9b8be5c> (NoMethodError

#Parent.new.name public_and_protected.rb:48:in `<main>': private method `name' called for #<Parent:0x892c5cc> (NoMeth

puts Parent.new.get_weight


