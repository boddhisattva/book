# source:- http://www.tutorialspoint.com/ruby/ruby_modules.htm
#!/usr/bin/ruby
require "./support"

class Decade
  #include Week  --> including here doesn't seem to be mandatory - reflect..(as a diff wrt require.)
  no_of_yrs=10
  def no_of_months
    puts Week::FIRST_DAY
    number=10*12
    puts number
  end
end
d1=Decade.new
puts Week::FIRST_DAY
Week.weeks_in_month
Week.weeks_in_year
d1.no_of_months