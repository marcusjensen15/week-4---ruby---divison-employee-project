class DivisionsController < ApplicationController

  def index
    @divisions = Division.all
    @employees = Employee.all
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
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @division = Division.find(params[:id])

    @division.destroy
    redirect_to root_path
  end

  def add
    @division = Division.find(params[:id])


    employee = Employee.where(employee_name: params[:employee].fetch("employee")).first

    employee.update(:division_id => @division.id)


    redirect_to division_path


  end

end


private
  def division_params
    params.require(:division).permit(:name)
  end
