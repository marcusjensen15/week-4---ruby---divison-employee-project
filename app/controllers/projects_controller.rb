class ProjectsController < ApplicationController


  def new
    @project = Project.new
    :new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
    :edit
  end

  def show
    @project = Project.find(params[:id])
    @employees = []
    Employee.all.each do |employee|
      if @project.employees.exclude?(employee)
        @employees.push(employee.employee_name)
      end
    end

    :show
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])

    @project.destroy
    redirect_to root_path
  end

  def add
    @project = Project.find(params[:id])
    # Division.where(name: employee_params.fetch("division_id")).first.id)
    employee = Employee.where(employee_name: params[:employee].fetch("employee")).first
    # binding.pry
    @project.employees << employee
    redirect_to project_path

  end

  def remove

    @project = Project.find(params[:id])
    # Division.where(name: employee_params.fetch("division_id")).first.id)
    employee = Employee.find(params[:employee_remove].fetch("employee_id"))
    # binding.pry
    @project.employees.delete(employee)
    redirect_to project_path


  end

end


private
  def project_params
    params.require(:project).permit(:project_name)
  end
