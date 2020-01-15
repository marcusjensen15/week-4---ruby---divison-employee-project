class EmployeesController < ApplicationController

  def new
    @employee = Employee.new
    :new
  end

  def create
    @employee = Employee.new(employee_params)
    # binding.pry
    if @employee.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    @division_names = []
    @division_ids = []
    Division.all.each do |division|
      @division_names.push(division.name)
      @division_ids.push(division.id)
    end
    :edit
  end

  def show
    @employee = Employee.find(params[:id])
    :show
  end

  def update
    @employee = Employee.find(params[:id])
    # division = Division.where(name: employee_params.fetch("division_id")).first



    if @employee.update(:employee_name => employee_params.fetch("employee_name"), :division_id => Division.where(name: employee_params.fetch("division_id")).first.id)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to root_path
  end

end


private
  def employee_params
    params.require(:employee).permit(:employee_name, :division_id)
  end
