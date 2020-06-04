require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/student')
also_reload('./models/*')

set :environment, :production

get '/' do
    erb(:main)
end

get '/students' do
    @all_students = Student.find_all_students()
    erb(:index)
end

get '/students/new' do
    erb(:new)
end

post '/students' do
    new_student = Student.new(params)
    erb(:create)
end
