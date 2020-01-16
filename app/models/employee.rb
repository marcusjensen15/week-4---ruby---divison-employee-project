class Employee < ApplicationRecord
  belongs_to :division
  has_and_belongs_to_many :projects
  before_save :capitalize
  validates :employee_name, presence: true
  scope :no_division, -> { where(division_id: 0)}

  def capitalize
    self.employee_name = self.employee_name.titleize()
  end

end
