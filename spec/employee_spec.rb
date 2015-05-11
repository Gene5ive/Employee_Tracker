require 'spec_helper'

describe(Employee) do
  it("belongs to a department") do
    division = Division.create({:name => "Sales"})
    employee = Employee.create({:name => "Steve", :division_id => division.id})
    expect(employee.division()).to(eq(division))
  end
end
