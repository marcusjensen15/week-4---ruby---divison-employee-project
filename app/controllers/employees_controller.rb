class EmployeesController < ApplicationController

  def new
    @employee = Employee.new
    :new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      flash[:notice] = "Employee Created"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    @division_names = []
    Division.all.each do |division|
      @division_names.push(division.name)
    end
    :edit
  end

  def show
    @employee = Employee.find(params[:id])
    @projects = []
    Project.all.each do |project|
      if @employee.projects.exclude?(project)
      @projects.push(project.project_name)
      end
    end
    :show
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(:employee_name => employee_params.fetch("employee_name"), :division_id => Division.where(name: employee_params.fetch("division_id")).first.id)
      flash[:notice] = "Employee Updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    flash[:notice] = "Employee Removed"
    redirect_to root_path
  end

  def add
    @employee = Employee.find(params[:id])
    # Division.where(name: employee_params.fetch("division_id")).first.id)
    project = Project.where(project_name: params[:project].fetch("project")).first
    # binding.pry
    @employee.projects << project
    flash[:notice] = "Project Added"
    redirect_to employee_path

  end

  def remove

    @employee = Employee.find(params[:id])
    # Division.where(name: employee_params.fetch("division_id")).first.id)
    project = Project.find(params[:project_remove].fetch("project_id"))
    # binding.pry
    @employee.projects.delete(project)
    flash[:notice] = "Project Removed"
    redirect_to employee_path

  end

end


private
  def employee_params
    params.require(:employee).permit(:employee_name, :division_id)
  end
