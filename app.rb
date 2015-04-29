require('sinatra')
require('sinatra/reloader')
require('./lib/vehicle')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/vehicles') do
  erb(:vehicles)
end

get('/add_vehicle') do
  erb(:add_vehicle)
end

get('/success') do
  @all_vehicles = @@vehicles.all
  erb(:success)
end


post('/success') do
make = params.fetch("make")
model = params.fetch("model")
year = params.fetch("year")

vehicle = Vehicle.new(make, model, year)
vehicle.save
  erb(:success)
end
