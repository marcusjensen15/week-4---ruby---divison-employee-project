require 'rails_helper'

describe Division, type: :model do
  it { should have_many(:employees) }
  it { should validate_presence_of :name }

  it ("capitalize name")do
    division = Division.create({name:"aeasd asdas"})
    expect(division.name()).to(eq("Aeasd Asdas"))
  end
end
