class Brother < Person
  include Person::Male

  def say_something
    'Hello, I am your brother.'
  end
end
