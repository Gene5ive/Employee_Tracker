require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
also_reload 'lib/**/*.rb'
require './lib/division'
require './lib/employee'
require 'pg'
require 'pry'

get('/') do
  erb(:index)
end

get('/divisions') do
  @divisions = Division.all
  erb(:divisions)
end

get('/divisions/add') do
  erb(:divisions_form)
end

get('/divisions/:id/edit') do
  @division = Division.find(params.fetch('id').to_i)
  erb(:divisions_edit)
end

post('/divisions') do
  name = params.fetch('name')
  Division.create({:name => name})
  @divisions = Division.all
  erb(:divisions)
end

patch('/divisions/:id') do
  name = params.fetch('name')
  @division = Division.find(params.fetch('id').to_i)
  @division.update({:name => name})
  @divisions = Division.all
  erb(:divisions)
end
