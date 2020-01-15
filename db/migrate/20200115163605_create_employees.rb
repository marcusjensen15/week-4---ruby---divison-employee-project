class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.column(:employee_name, :string)
      t.column(:division_id, :int)
    end
  end
end
