class DepartmentsController < ApplicationController
  before_action :set_department,
                only: [:show, :edit, :update, :destroy]

  def index
    @departments = Department.order(:name)
  end

  def show
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)

    if @department.save
      redirect_to departments_path,
                  notice: "Department created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @department.update(department_params)
      redirect_to departments_path,
                  notice: "Department updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @department.destroy
    redirect_to departments_path,
                notice: "Department deleted successfully."
  end

  private

  def department_params
    params.require(:department).permit(
      :name, 
      :description
    )
  end

  def set_department
    @department = Department.find(params[:id])
  end
end