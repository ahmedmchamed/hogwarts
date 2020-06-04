require_relative('../db/sqlrunner')

class House

    attr_accessor :name, :url
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i() if options['id']
        @name = options['name']
        @url = options['url']
        if @id.nil?
            save
        end
    end

    def save()
        sql = "INSERT INTO houses
        (name, url) 
        VALUES ($1, $2) RETURNING id;"
        values = [@name, @url]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
    end

    def self.find_by_id(id)
        sql = "SELECT * FROM houses WHERE id = $1;"
        values = [id]
        house_hash_result = SqlRunner.run(sql, values)
        house_array_result = self.map_house_data(house_hash_result)
        return house_array_result.first()
    end

    def self.find_all_houses()
        sql = "SELECT * FROM houses;"
        house_hash_result = SqlRunner.run(sql)
        return self.map_house_data(house_hash_result)
    end

    def self.map_house_data(house_hash_data)
        return house_hash_data.map { |house| House.new(house) } 
    end

end