require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/student')
require_relative('./models/house')
also_reload('./models/*')

set :environment, :production

get '/' do
    erb(:main)
end

get '/students' do
    @all_students = Student.find_all_students_information()
    erb(:index)
end

get '/students/new' do
    @all_houses = House.find_all_houses
    erb(:new)
end

post '/students' do
    new_student = Student.new(params)
    erb(:create)
end
