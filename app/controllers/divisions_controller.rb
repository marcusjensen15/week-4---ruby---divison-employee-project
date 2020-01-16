class DivisionsController < ApplicationController

  def index

    @divisions = Division.all
    @employees = Employee.all - Employee.no_division
    @projects = Project.all
    :index
  end

  def new
    @division = Division.new
    :new
  end

  def create
    @division = Division.new(division_params)
    if @division.save
      flash[:notice] = "Division Created"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @division = Division.find(params[:id])
    :edit
  end

  def show
    @division = Division.find(params[:id])
    @employees = []
    Employee.all.each do |employee|
    if employee.division_id != @division.id
      @employees.push(employee.employee_name)
      end
    end
    :show
  end

  def update
    @division = Division.find(params[:id])
    if @division.update(division_params)
      flash[:notice] = "Division Update"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @division = Division.find(params[:id])
    @division.destroy
    flash[:notice] = "Division Removed"
    redirect_to root_path
  end

  def add
    @division = Division.find(params[:id])
    employee = Employee.where(employee_name: params[:employee].fetch("employee")).first
    employee.update(:division_id => @division.id)
    flash[:notice] = "Employee Added"
    redirect_to division_path


  end

end


private
  def division_params
    params.require(:division).permit(:name)
  end
