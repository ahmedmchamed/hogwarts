require_relative('../db/sqlrunner')

class Student

    attr_accessor :first_name, :second_name, :house, :age
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @first_name = options['first_name']
        @second_name = options['second_name']
        @house = options['house']
        @age = options['age'].to_i()
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

    def self.find_by_id(id)
        sql = "SELECT * FROM students where id = $1;"
        values = [id]
        student_hash_result = SqlRunner.run(sql, values)
        student_array_result = self.map_student_data(student_hash_result)
        return student_array_result.first()
    end

    def self.find_all_students()
        sql = "SELECT * FROM students;"
        student_hash_result = SqlRunner.run(sql)
        return self.map_student_data(student_hash_result)
    end

    def self.map_student_data(student_hash_data)
        result = student_hash_data.map { |student| Student.new(student) }
    end

end