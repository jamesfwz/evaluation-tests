class Mother < Parent
  include Person::Female

  def say_something
    'Hello, I am your mother.'
  end
end
