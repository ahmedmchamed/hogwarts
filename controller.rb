require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/student')
also_reload('./models/*')

get '/' do
    erb(:main)
end

get '/students' do
    @all_students = Student.find_all_students()
    erb(:index)
end
