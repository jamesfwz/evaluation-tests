# Rails-test-6

## Create a database to store the information below:

#### Person
```
Name
Age
Gender
```

#### Assume:
```
Father: John Fwz
Mother: Lily Fwz
Son:
  - William Fwz
  - Michael Fwz 
Daughter:
  - Ava Fwz
  - Mia Fwz
```
The system must be provide these functions:
```
john.first_name => "John"
john.name => "John Fwz"
william.parents => [john, lily]
william.father => john
william.mother => lily
john.say_something => "Hello, my name is John Fwz."
william.father.say_something => "Hello, I am your father."
william.mother.say_something => "Hello, I am your mother."
lily.sons => [william, michael]
lily.children => [william, michael, ava, mia]
lily.daughters => [ava, mia]
lily.daughters.first.say_something = "Hello, I am your daughter."
william.brothers => [michael]
john.father_of?(mia) => true
john.age => 40
william.age => 18
john.older_than(william) => 22
```
Ensure:
```
Age > 0
Must over 20 to be a father
Must over 18 to be a mother
A person has only one father, mother
Father, Son, Brother are male
Mother, Daughter are female
Searchable by full name 
```
