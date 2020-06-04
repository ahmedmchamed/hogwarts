require_relative('./models/student.rb')
require_relative('./models/house.rb')
require('pry')

############
###HOUSES###
############

gryffindor = House.new({
    'name' => 'Gryffindor',
    'url' => 'Gryffindor.png'
})

hufflepuff = House.new({
    'name' => 'Hufflepuff',
    'url' => 'Hufflepuff.png'
})

ravenclaw = House.new({
    'name' => 'Ravenclaw',
    'url' => 'Ravenclaw.png'
})

slytherin = House.new({
    'name' => 'Slytherin',
    'url' => 'Slytherin.png'
})

House.new({
    'name' => 'Staff',
    'url' => 'https://placebear.com/g/50/50'
})

################
####STUDENTS####
################

harry = Student.new({
    "first_name" => "Harry",
    "second_name" => "Potter",
    "house_id" => gryffindor.id,
    "age" => 11
})

hermione = Student.new({
    "first_name" => "Hermione",
    "second_name" => "Granger",
    "house_id" => gryffindor.id,
    "age" => 11
})

ron = Student.new({
    "first_name" => "Ron",
    "second_name" => "Weasly",
    "house_id" => gryffindor.id,
    "age" => 12
})

draco = Student.new({
    "first_name" => "Draco",
    "second_name" => "Malfoy",
    "house_id" => slytherin.id,
    "age" => 13
})

qq = Student.new({
    "first_name" => "Quirinus",
    "second_name" => "Quirrell",
    "house_id" => ravenclaw.id,
    "age" => 42
})

luna = Student.new({
    "first_name" => "Luna",
    "second_name" => "Lovegood",
    "house_id" => ravenclaw.id,
    "age" => 15
})

pomonia = Student.new({
    "first_name" => "Pomonia",
    "second_name" => "Sprout",
    "house_id" => hufflepuff.id,
    "age" => 65
})


binding.pry
nil
