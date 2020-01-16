class Division < ApplicationRecord
  has_many :employees, dependent: :nullify
  after_destroy :reset_id
  before_save :capitalize
  validates :name, presence: true

  def reset_id
    Employee.all.each do |employee|
      if employee.division_id == nil
        employee.update(:division_id => 0)
    end
  end
end

  def capitalize
    self.name = self.name.titleize()
  end

end
