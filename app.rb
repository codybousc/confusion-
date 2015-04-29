require('sinatra')
require('sinatra/reloader')
require('./lib/vehicle')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/vehicles') do
  @vehicles = Vehicle.all()
  erb(:vehicles)
end

get('/vehicles/:id') do
  @vehicle = params.fetch("id").to_i()
  erb(:vehicle)
end

get('/add_vehicle') do
  erb(:add_vehicle)
end

get('/success') do
  @vehicle
  erb(:success)
end

post('/success') do
  make = params.fetch("make")
  model = params.fetch("model")
  year = params.fetch("year")

  @vehicle = Vehicle.new(make, model, year)
  @vehicle.save
  erb(:success)
end
