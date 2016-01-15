class Father < Parent
  include Person::Male

  def say_something
    'Hello, I am your father.'
  end
end
