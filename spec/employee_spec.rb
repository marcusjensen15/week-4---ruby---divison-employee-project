require 'rails_helper'

describe Employee, type: :model do
  it { should belong_to (:division) }
  it { should have_and_belong_to_many :projects }
  it { should validate_presence_of :employee_name }
  it ("capitalize name")do
  division = Division.create({name:"aeasd asdas"})
    employee = Employee.create({"employee_name" =>"aeasd asdas", "division_id" => division.id})
    expect(employee.employee_name()).to(eq("Aeasd Asdas"))
  end
end
