class Division < ApplicationRecord
  has_many :employees, dependent: :nullify
  after_destroy :reset_id

  def reset_id
    self.employees.each do |employee|
      employee.division = Division.find(0)
    end
  end

end
