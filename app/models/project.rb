class Project < ApplicationRecord
  has_and_belongs_to_many :employees
  before_save :capitalize
  validates :project_name, presence: true


  def capitalize
    self.project_name = self.project_name.titleize()
  end

end
