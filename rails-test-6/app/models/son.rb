class Son < Person 
  include Person::Male

  def say_something
    'Hello, I am your son.'
  end
end
