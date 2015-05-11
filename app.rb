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

#all division employees
get('/divisions/:id/employees') do
  @division = Division.find(params.fetch('id').to_i)
  erb(:division_employees)
end
#---------------------

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
#--------------

#all employees
get('/employees') do
  @employees = Employee.all()
  erb(:employees)
end
#--------------

#add employee
get('/employees/add') do
  erb(:employees_form)
end

post('/employees') do
  name = params.fetch('name')
  Employee.create({:name => name})
  @employees = Employee.all
  erb(:employees)
end
#--------------

#edit/delete employee
get('/employees/:id') do
  @employee = Employee.find(params.fetch('id').to_i)
  @divisions = Division.all()
  erb(:employees_edit)
end
#-------------------

#edit employee
patch('/employees/:id') do
  division_id = params.fetch('division_id').to_i
  @employee = Employee.find(params.fetch('id').to_i)
  @employee.update({:division_id => division_id})
  @employees = Employee.all
  erb(:employees)
end
#---------------

#delete employee
delete('/employees/:id') do
  @employee = Employee.find(params.fetch('id').to_i)
  @employee.delete
  @employees = Employee.all
  erb(:employees)
end
#--------------
