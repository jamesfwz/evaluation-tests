class Daughter < Person 
  include Person::Female

  def say_something
    'Hello, I am your daughter.'
  end
end
