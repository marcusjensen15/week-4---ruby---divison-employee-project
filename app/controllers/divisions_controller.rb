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

end


private
  def division_params
    params.require(:division).permit(:name)
  end
