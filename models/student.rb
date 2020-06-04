require_relative('../db/sqlrunner')

class Student

    attr_accessor :first_name, :second_name, :house, :age
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @first_name = options['first_name']
        @second_name = options['second_name']
        @house = options['house']
        @age = options['age'].to_int()
        if @id.nil?
            save
        end
    end

    def save()
        sql = "INSERT INTO students 
        (first_name, second_name, house, age) 
        VALUES ($1, $2, $3, $4) RETURNING id;"
        values = [@first_name, @second_name, @house, @age]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
    end

end