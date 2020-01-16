require 'rails_helper'

describe Project, type: :model do
  it { should have_and_belong_to_many :employees }
  it { should validate_presence_of :project_name }
  it ("capitalize name")do
    project = Project.create({project_name:"aeasd asdas"})
    expect(project.project_name()).to(eq("Aeasd Asdas"))
  end
end
