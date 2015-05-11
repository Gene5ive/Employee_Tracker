require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
also_reload 'lib/**/*.rb'
require './lib/division'
require './lib/employee'
require 'pg'
require 'pry'

#main page
get('/') do
  erb(:index)
end
#---------

#all divisions
get('/divisions') do
  @divisions = Division.all
  erb(:divisions)
end
#-------------

#add division
get('/divisions/add') do
  erb(:divisions_form)
end

post('/divisions') do
  name = params.fetch('name')
  Division.create({:name => name})
  @divisions = Division.all
  erb(:divisions)
end
# -----------

#edit/delete division
get('/divisions/:id') do
  @division = Division.find(params.fetch('id').to_i)
  erb(:divisions_edit)
end
#-------------------

#edit division
patch('/divisions/:id') do
  name = params.fetch('name')
  @division = Division.find(params.fetch('id').to_i)
  @division.update({:name => name})
  @divisions = Division.all
  erb(:divisions)
end
#--------------

#delete division
delete('/divisions/:id') do
  @division = Division.find(params.fetch('id').to_i)
  @division.delete
  @divisions = Division.all
  erb(:divisions)
end
