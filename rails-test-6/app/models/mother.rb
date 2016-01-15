class Mother < Person
  include Person::Female

  def say_something
    'Hello, I am your mother.'
  end
end
